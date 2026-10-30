Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357327;
	b=bz7BMQfKZhpc7PpHBoM0Hik8Ja2sXrYdS1Gw4yX1CqJPqZdPch4zaMgqZ9LLFvmzRdxm
	 jGnSdOvWqe4h+YDnxJ6Y+Mstd97c+RrMvNrxiw+Wokly4RnoN51v9IGbRWKpnlq50bKqx
	 CtpsvgYTAXhLpsoE7Xe44l3dt4w9yAYdVOEsJKGOgtJntkLcR/7Fq9UVtgA42gZVBPJlH
	 AJxStrsQjUROlv0Q73E3xmz76M2kjKhoOOzigK36L7wuVSlF3zq2fn2sZurDJ5dimZLrG
	 c8w/W9WkMMptwzc5cPOoJkUmqfz5p3zRcCcxgSzC4C8mn6ki6tcDU7cqGSc1GrAWojQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357327;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TNiX7MAgORnhNq15HmODad+Hr6noQTrwj5f5jdgl51A=;
	b=ZOG5oLgF+5S8DHZY07ZSTxrqV0CKQyA2KC2LG26SrKiWj7iIxADDhn+wcL0ICTqFGdKP
	 ZpjzAbWOnV5VmuFCb/4IDX4bXU5Jn9LuhFz2fRNJC0RnpDPIiqkOhupOGdb1q01eUcQs7
	 QvLW9Tx1/TfjUG5Cc0SMvT72+gYFmNPgHril4XHjq65IJo0eMEPQJRKMA3MQlNuXYr/Gt
	 lR6C30cA+PZLof+QAXgwP8AJhxRAyU41loQ46q06qsjJFKhNRXeFqx1zYOg5uxzFl0UpZ
	 as8H9FFTCMQLdI5mGUA2namHvu3KpnYnaFE2gIeBlaRpyav5Kpi9av2EAlQA2InXzcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kZ7I/7Ng";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4FA606A33F;
	Fri, 30 Oct 2026 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZ7I/7Ng
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479ED1F000C1;
	Fri, 30 Oct 2026 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357326;
	bh=TNiX7MAgORnhNq15HmODad+Hr6noQTrwj5f5jdgl51A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kZ7I/7NgbOrLtfxupPns58mCsz986hH3wi+7BppUh5UbJASTVJpYtn6xzS/z8VPJ9
	 tn4Ih+DziQWb/8wJF2YDCxZh/4KrIdPnkZ+RtTvaTF02JeLellY5pOr6saj+rIFSs2
	 taNEeMn2j0HD7aiz5RchHQ6isPLqeq3H/H5vbJxvsPyRIZ98lYuBb33fbFa0RZEi1d
	 qUEtUlOFVr/7qoJV8rgAM0KmNTnsJBnSs/fVSnd8rXvnCwugwZbRm9rPasxIwrBfS5
	 mRgwEz29tOK2utF2hkqHcg6U6hqb85P2MT/HOtzhp5bsos6UkIf8KUvduPA63R8Eu0
	 XZTrbjcFz2baw==
Date: Fri, 30 Oct 2026 11:48:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Brian Norris <briannorris@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba
 mailbox bindings
Message-ID: <20261030-terrific-quartz-bumblebee-e36da1@quoll>
References: <20261023235408.3063350-1-dianders@chromium.org>
 <20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>

On Fri, Oct 23, 2026 at 04:52:20PM -0700, Douglas Anderson wrote:
> +properties:
> +  compatible:
> +    const: google,lga-mailbox-array
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Host registers (not accessible to client)
> +      - description: Global registers (not present on newer IP blocks)

That's still confusing. Last time you said:
1. You identified 4x instances of MBA
2. Each of the instance has global registers (quotting: "Each of these 4
MBA instances has its own "global" registers."), then why does the
binding say otherwise?

You repeat here again "newer IP blocks" so how many versions does your SoC have?

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
> +      google,tx-payload-words:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        maximum: 256
> +        default: 0
> +        description:
> +          For queue-mode only, the number of 32-bit words in each message we
> +          send to the remote processor. If not specified, this is assumed to
> +          be 0. This is only for queue mode where we need to divide up the
> +          message buffer into chunks.
> +
> +      google,mba-queue-mode:
> +        type: boolean
> +        description:
> +          The remote processor is expecting the shared memory to be treated
> +          as a circular queue and that there may be several outstanding
> +          messages at once. Only usable on instances with counted doorbell
> +          interrupts.
> +
> +    dependencies:
> +      google,tx-payload-words: ['google,mba-queue-mode']
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
> +      mailbox-array@5240000 {
> +        compatible = "google,lga-mailbox-array";
> +        reg = <0x0 0x05240000 0x0 0x00010000>,
> +              <0x0 0x05250000 0x0 0x00010000>;
> +        ranges = <0x0 0x0 0x05260000 0x00020000>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        mailbox@0 {
> +          reg = <0x0000 0x1000>;
> +          interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +          #mbox-cells = <0>;
> +
> +          google,tx-payload-words = <4>;
> +          google,mba-queue-mode;
> +        };
> +
> +        mailbox@1000 {
> +          reg = <0x1000 0x1000>;
> +          interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
> +

Please make the example complete. Last time you wrote:

"If we tried to represent the mailbox array as a single mailbox with a
bunch of channels, each instance would have a different number of
"reg" entries and a different number of interrupts."

and I do not see that. I see each instance having exactly one reg entry,
exactly one interrupt with difference in RX and TX.

The DTS here:
https://lore.kernel.org/all/20261026144346.1.Iaf8214205f496225013f482f6e0035e89ac624f2@changeid/

has the same.

Best regards,
Krzysztof

