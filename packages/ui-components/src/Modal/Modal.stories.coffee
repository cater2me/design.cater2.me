import React from 'react';
import { storiesOf, forceReRender } from '@storybook/react';
import { withKnobs, boolean, select } from '@storybook/addon-knobs';

import Button from '../Button'
import Modal from './Modal'

isOpen = true
closeModal = ->
  isOpen = true
  forceReRender()
  isOpen = false
  forceReRender()

storiesOf('Components|Modal', module)
  .addDecorator withKnobs
  .add 'withKnobs', ->
    <Modal
      className="with-knobs-modal"
      size={select('size', ['sm', 'md', 'lg'], 'sm')}
      isOpen={boolean('isOpen', isOpen)}
      onHide={closeModal}
    >
      <Modal.Header>
        <Modal.Title>Modal.Title</Modal.Title>
      </Modal.Header>
      <Modal.Body className="with-knobs-modal__body">
        Modal.Body
      </Modal.Body>
      <Modal.Footer className="with-knobs-modal__footer">
        <Button onClick={closeModal}>Cancel</Button>
      </Modal.Footer>
    </Modal>
