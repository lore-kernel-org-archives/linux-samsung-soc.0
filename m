From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V2] ASoC: SAMSUNG: Add DT support for i2s
Date: Fri, 28 Sep 2012 14:33:55 +0530
Message-ID: <CAAgF-Bc_KwJgcDOOkzrqcondGnmHDQ08s9Ooq61DbON7ZZtvmA@mail.gmail.com>
References: <1348741532-29412-1-git-send-email-padma.v@samsung.com>
	<506470A5.3070307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:44489 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753038Ab2I1JD5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Sep 2012 05:03:57 -0400
Received: by bkcjk13 with SMTP id jk13so3040471bkc.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Sep 2012 02:03:55 -0700 (PDT)
In-Reply-To: <506470A5.3070307@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, sangsu4u.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Thu, Sep 27, 2012 at 8:58 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 09/27/2012 04:25 AM, Padmavathi Venna wrote:
>> Add support for device based discovery.
>
>> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
>
>> +i2s@03830000 {
>> +     compatible = "samsung,samsung-i2s";
>> +     reg = <0x03830000 0x100>;
>
>> +     tx-dma-channel-secondary = <&pdma0 8>;
>> +     tx-dma-channel = <&pdma0 10>;
>> +     rx-dma-channel = <&pdma0 9>;
>> +     supports-6ch;
>> +     supports-rstclr;
>> +     supports-secdai;
>
> Those 6 properties are custom to this binding so should have a vendor
> prefix, e.g. "samsung,supports-6ch".
Okay. I will change this.
>
> Also, I wonder if this shouldn't wait for the forthcoming standardized
> DT DMA bindings (or perhaps document custom bindings that are identical
> to the new standardized bindings)? Otherwise, the DMA stuff will all
> have to be redefined again. Apparently it's hoped the bindings will be
> in 3.7, or if not there, in 3.8.
Okay. Once the generic DT DMA bindings are available I will use that.
But It will be good if atleast other things get reviewed.

Thanks
Padma
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
