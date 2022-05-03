#!/bin/bash


  # Get the workspace filename 
  WSFILE=$(cat $TMPDIR/download.txt | grep "\.itksnap$") 

  ########################
  ######  YOUR CODE  #####
  ########################

  # Create a workspace to hold the results
  WSRESULT=$WORKDIR/$(printf ticket_%08d_result.itksnap $TICKET_ID)
  itksnap-wt -i $WSFILE \
    -layers-add-seg $WORKDIR/mask.nii.gz -props-set-nickname "Segmentation" \
    -layers-list \
    -o $WSRESULT

  # Upload the result workspace
  itksnap-wt -i $WSRESULT -dssp-tickets-upload $TICKET_ID 