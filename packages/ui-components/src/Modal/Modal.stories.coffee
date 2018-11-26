import React from 'react';
import { storiesOf } from '@storybook/react';
import { withKnobs, boolean, select } from '@storybook/react';

import Button from '../Button'
import Modal from './Modal'

storiesOf('Components|Modal', module)
  .addDecorator withKnobs
  .add 'withKnobs', ->
    isOpen = boolean('isOpen', true)
    closeModal = ->
      isOpen = boolean('isOpen', false)
    <Modal
      className="with-knobs-modal"
      size={select('size', ['sm', 'md', 'lg'], 'sm')}
      isOpen={isOpen}
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
