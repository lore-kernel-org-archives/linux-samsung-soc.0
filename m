Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E5D1F192E;
	Wed, 15 Jul 2026 04:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784091100; cv=none; b=TccjPpZteLg0g95mSkrXFZYBA0ehqhm/VCDn5Jf+cdCm0/WmFlXUFH2UNaqazgormGkrvcu62HoqNO3UzeTeyPv9Be+gvQBBDN36Ka52tLiMrC/QDbRp8hv4qFeFOMxSxFqS8hSgFTqQe86YwzYJSlIMPBCXL6z0CDyLmBIKg8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784091100; c=relaxed/simple;
	bh=9lvYt8KSuD57ygcE2mF06Y2OMm9IyUava049upVPsxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0Qo0cJep7VcBwgCkXvrYI9bVfH6hkdOD4aQWP2JBfmMKhFfiGmHKwt1Q2LvHSqCTApOdkxE4xl27E2WZLV1ARUHhVFiLHsJgvPL72FcNG3EL7RWQAMqiHjiUQQ7Qu5s53bbBmnMk59RGcKG8m6E71fj0Hxaeeozi25lUPB46Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNhapHtI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNhapHtI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07301F000E9;
	Wed, 15 Jul 2026 04:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784091098;
	bh=eo7gGws/DrbN8yHGv13gYgUCN6nrmJ83aBUglPh9mis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GNhapHtIMPmtpx8b8TAke80Lgf1mC3YO0kfyB631tIo6xcRYWy8CvjiX+qKVoWXlR
	 aLw6uEbbhNwrjHq5oqZfbzHVvafnlN/Edj2F4av/NLucgcmSnA7Z2Yptd9+t8d0y67
	 UvhlMwWPi4hjFwF8TJ3c4wSiD63kMTxkpFBONVqeNTR8VKmK/KPjF/ClG4yYtDZQVh
	 LV1RuoLorPllIFm+7ZQvdLyldD75PbnwCCWv8Ntplv3OvSda2xwWYQB/+2D4ZgIg/y
	 QNytvDGyZeNEzcZfM325GwHe0miH8tqYe4S+xwXSq16g+//xEaTf8cgMx/lRrdqwhl
	 m1inbos8qFHzA==
Message-ID: <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org>
Date: Wed, 15 Jul 2026 06:51:31 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox
 bindings
To: Douglas Anderson <dianders@chromium.org>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
 Subhash Jadavani <sjadavani@google.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>,
 Brian Norris <briannorris@chromium.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2026 00:21, Douglas Anderson wrote:
> Introduce bindings for the MailBox Array IP block present in Laguna
> SoCs (AKA "lga", AKA "Google Tensor G5").
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  .../bindings/mailbox/google,mba.yaml          | 216 ++++++++++++++++++

Filename must match compatible.

>  1 file changed, 216 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/google,mba.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/google,mba.yaml b/Documentation/devicetree/bindings/mailbox/google,mba.yaml
> new file mode 100644
> index 000000000000..6c4505a369e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/google,mba.yaml
> @@ -0,0 +1,216 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 Google LLC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/google,mba.yaml#
> +$schema: http://devicetree.org/meta-schemas/base.yaml#
> +
> +title: Google MailBox Array
> +
> +maintainers:
> +  - Douglas Anderson <dianders@chromium.org>
> +
> +description: |
> +  The Google MailBox Array (MBA) is an IP block in Google-designed SoCs
> +  starting in Laguna (AKA "lga", AKA Google Tensor G5). In a typical SoC
> +  that includes this IP block, there are a number of instances of the MBA
> +  controller with each instance having slightly different hardware
> +  parameters and intended for communication with a different remote
> +  processor.
> +
> +  An MBA instance has a "host" that is defined as the processor "providing"
> +  a "service". This is typically not the main Application Processor (AP) but
> +  is instead some specialized co-processor in the SoC like the Central Power
> +  Manager (CPM). A processor (like the AP) talking to the "host" of the MBA
> +  is a "client" of the MBA. A given MBA instance only ever has one host, but
> +  it may have several clients. For instance, the CPM (an MBA "host") may need
> +  to send/receive mailbox messages not just from the AP but from other
> +  processors in the SoC and each of these other processors can be "clients"
> +  of the same MBA.
> +
> +  The "host" of an MBA instance has full access to everything in the MBA
> +  instance. It can access its own private set of "host" MBA registers, the
> +  "global" MBA registers (if they exist), and all of the "client" MBA
> +  registers.
> +
> +  A "client" of an MBA instance has access to the "global" MBA registers (if
> +  they exist) and one or more sets of "client" MBA registers.
> +
> +  These bindings are focused on describing the MBA from the point of view of
> +  a single client.
> +
> +  As per above, a client may have access to several sets of MBA "client"
> +  registers. Each set of "client" registers represents a logical mailbox
> +  "channel". However, because each channel may have different configuration
> +  parameters and a mailbox "channel" in typical usage means one of a number
> +  of identical channels, each channel in a Google MailBox Array is typically
> +  referred to as a full "mailbox" and the whole collection of mailboxes as
> +  the "mailbox array".
> +
> +  Mailboxes in an MBA instance have these features:
> +  * 1 to 256 32-bit words of shared memory.
> +  * The ability for the client to ring the main doorbell of the host and be
> +    notified when the host Acks the doorbell.
> +  * The ability for the host to ring the main doorbell of the client and be
> +    notified when the client Acks the doorbell.
> +
> +  Some mailboxes may also have the ability to have counted doorbells. This
> +  means that the receiver of the doorbell can tell how many times it rung.
> +  This is intended for implementing "queued" mailboxes. See below.
> +
> +  The MBA hardware doesn't have any specific directionality. That is to
> +  say, both the host and the client have full read and write access to
> +  their shared memory. All mailbox instances have doorbells going both from
> +  the client to the host as well as the host to the client.
> +
> +  The mailboxes can only be used for communication if the host and client
> +  both agree on conventions. These conventions are described in the
> +  device tree as they describe how the remote firmware is expecting to
> +  communicate.
> +
> +  Current known in-use conventions:
> +  1. An RX mailbox with payloads that are of a well-defined size.
> +     On mailboxes of this type, the host is the only one to write shared
> +     memory. After placing a fixed-size message in shared memory, it rings
> +     the main doorbell of the client. The client reads the message and Acks
> +     the doorbell.
> +  2. A TX mailbox with payloads that could vary in size.
> +     On mailboxes of this type, the mailbox client is the only one to write
> +     shared memory. The client always writes a payload to the start of shared
> +     memory and rings the main host doorbell. The client then looks for the
> +     host to Ack the doorbell. The clients of the mailbox have ways to know
> +     the size of any given message.
> +  3. A half-duplex TX/RX mailbox. This is a mailbox that can switch between
> +     convention #1 and #2 above. Since both sides write data to the start of
> +     shared memory, the two sides must have some convention to know whose
> +     turn it is to send a message.
> +  4. A "queued" RX mailbox with a payload of a well-defined size.
> +     This type of mailbox is only possible if the MBA instance can count
> +     doorbells. On mailboxes of this type, the host is the only one to write
> +     shared memory. When the client doorbell rings, the client reads a
> +     fixed-size from the next "slot" in shared memory and then updates its
> +     internal state. The shared memory is treated as a circular queue.
> +  5. A "queued" TX mailbox with a payload of a well-defined size.
> +     This type of mailbox is only possible if the MBA instance can count
> +     doorbells. On mailboxes of this type, the mailbox client is the only one
> +     to write shared memory. The shared memory is treated as a circular queue.
> +     The client writes a fixed-sized payload to the next "slot" in the shared
> +     memory (where the slot size is determined by the client's first transfer),
> +     updates its internal state, and rings the host doorbell. The client can
> +     keep writing more messages as long as the circular queue isn't full. The
> +     client gets an interrupt when the host Acks a doorbell and can tell how
> +     many doorbells still haven't been Acked.
> +
> +  Conventions will be supported with a small number of properties specified
> +  for each mailbox.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - google,lga-mailbox-array
> +      - const: google,mailbox-array

Don't use generic fallback. Just the SoCs.


> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Host registers (not accessible to client)
> +      - description: Global registers (not present on newer IP blocks)

You have only one SoC. One SoC has only one IP block, no?

> +
> +  ranges: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^mailbox@[0-9a-f]+$":
> +    type: object
> +    description:
> +      Each sub-node is a single-channel mailbox.

This does not look like correct representation. You have one mailbox
controller with multiple mailboxes, not multiple mailbox controllers of
single channel boxes.


> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      "#mbox-cells":
> +        const: 0
> +
> +      google,rx-payload-words:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        maximum: 256
> +        default: 0
> +        description:
> +          The number of 32-bit words in each mailbox message from the remote
> +          processor. May be 0 for doorbell-only. If not specified this is
> +          assumed to be 0.
> +
> +      google,mba-queue-mode:
> +        type: boolean
> +        description:
> +          The remote processor is expecting the shared memory to be treated
> +          as a circular queue and that there may be several outstanding
> +          messages at once. Only usable on instances with counted doorbell
> +          interrupts.
> +
> +    required:
> +      - reg
> +      - interrupts
> +      - "#mbox-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - ranges
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      cpm_ap_ns_mba: mailbox-array@5240000 {

Drop all unused labels.


Best regards,
Krzysztof
