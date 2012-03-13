From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v4 2/2] ARM: Exynos: Add device tree support for interrupt combiner
Date: Tue, 13 Mar 2012 12:16:17 +0530
Message-ID: <CAJuYYwQGbhtxNg0G=QMooMfH8Mkf8KwSzLk61OkpwL4ZuR1fDQ@mail.gmail.com>
References: <1329798806-32482-1-git-send-email-thomas.abraham@linaro.org>
	<1329798806-32482-3-git-send-email-thomas.abraham@linaro.org>
	<20120313035246.6BC8A3E07E4@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:52388 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751245Ab2CMGqS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 02:46:18 -0400
Received: by wejx9 with SMTP id x9so165517wej.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Mar 2012 23:46:17 -0700 (PDT)
In-Reply-To: <20120313035246.6BC8A3E07E4@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On 13 March 2012 09:22, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Tue, 21 Feb 2012 10:03:26 +0530, Thomas Abraham <thomas.abraham@li=
naro.org> wrote:
>> Add device tree based instantiation of the interrupt combiner contro=
ller.
>>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Cc: Rob Herring <rob.herring@calxeda.com>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> @@ -406,13 +432,33 @@ void __init combiner_init(void __iomem *combin=
er_base, struct device_node *np)
>>
>> =A0 =A0 =A0 for (i =3D 0; i < MAX_COMBINER_NR; i++) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 combiner_init_one(i, combiner_base + (i =
>> 2) * 0x10);
>> - =A0 =A0 =A0 =A0 =A0 =A0 combiner_cascade_irq(i, IRQ_SPI(i));
>> +#ifdef CONFIG_OF
>> + =A0 =A0 =A0 =A0 =A0 =A0 irq =3D np ? irq_of_parse_and_map(np, i) :=
 IRQ_SPI(i);
>> +#else
>> + =A0 =A0 =A0 =A0 =A0 =A0 irq =3D IRQ_SPI(i);
>> +#endif
>
> Hmmm, the #ifdef is rather ugly. =A0I'd rather have an empty
> irq_of_parse_and_map() that always returns 0.
>
> The patch series is fine, and you can add my acked-by, but please sen=
d
> a follow-up patch to clean it up.
>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
>

Thanks. I will send a follow-up to clean it.

Regards,
Thomas.
