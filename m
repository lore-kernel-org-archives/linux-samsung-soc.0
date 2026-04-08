Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826F03CA48B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Apr 2026 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775653686; cv=none; b=q2Cl+gTLIs8TKmHk7/MWdeahURP5aAA1MRr2nTuj955+GgwIenbje6sgKVvf0Zv49HqF4+lt5IWRyKJs3Jkew8Y3VDZIPrnp43LOL98POrDTecTmkDhu1/e0Ro0zs+BGfCeJ4pj1t1/QvNkgDnRE4aSYQiMlmYirTdIBa7SUX/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775653686; c=relaxed/simple;
	bh=a2GPSLjoVuh/bOAiRRBM+nHcSa++S79DoAQOpkjg8+c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bCHcBNk0um61eGd7xgIgVvUiSZZQ0LV5XldylZxkE72y7d4jtmB6MQCMpu5VDQiATcBURCtN8JuFxC/dRfzvVeAReiJ5dd8t+Brrf81RB3Q23BUVbi/+FFmcyJDOeryS/EKDleBi94qptCM069o0MK3NxCCxc63Eop1gsiHuHYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zjcC2sOw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zjcC2sOw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so832116166b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Apr 2026 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775653682; x=1776258482; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5yV3renFUCMzTGFq9ONgz22Ec7d4PCew4CFxTTtr88=;
        b=zjcC2sOwDqQfuUIFywmtGZc84hozfRNS9XYMKBqdUzHbdPMUFI0nzEc44PdEp88MZB
         JOtF459HOomRnksA2u35hpcoymiwgM3Kws544WEUrYqU+r2YkcCbRGPpY5hVV0lzRzWc
         7o4cKONgBWDXsnwg3HNeoXCvNqjp8BMGysOZ6VUF9KsuHadjdSyDX5y1ZVz5OeDrzUTo
         CCIOtN2mgdFv5ZwwJk+TsJOOlEdfbScsfdsP65ZwD4u0BTPUt7iWPV4PgmQDZD6GTKI6
         WqIptT1AwhRP9Ss6JD78wV6ABPF7AII8aqQGzRWoZzM7huvDc3PmZWcbV7coY4sXGAV4
         soVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653682; x=1776258482;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z5yV3renFUCMzTGFq9ONgz22Ec7d4PCew4CFxTTtr88=;
        b=ojkDxXU7BzYE9Iv88kh1MI2wYDzFq6pWY31bA1i22WanbRkjHaZhPvXxAhCxOmfChL
         JLgmXgp42wZmXPVY5UU0vToQUtPX0W1lT36yTFTqqscE5WjHqe0NgvNND47ahQyku9BS
         9DwZn9psZGRE2F9KuM7KGrJAkNajk+nQt9fRSReD81/O9vBYpKxhh30aWl8IxopH0rfB
         IJp6p+Qr7VZhryP9CBPfuEukchanYCfgdmQEiGeH6C5QcaBYfqm9ylNjK53JvXum0KlD
         46LoDtMreAJaULqvbydQy3m+AOXWkrMZHIve399MCcFv8t40idAL/y7YaxvtEvyoKsCX
         aTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWllWKxZ30fb46VvQjZgRDRDOL3qveeHiPuBLh+iyx9ucaGbfsoG+OWOWVjFJRxBjll/BasHIdVFeDT3S8oMPSm9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvehQmlkICLEqzSgO4i/IkOnI3zM1WfeDH4zRqGhMK5e9ciBTR
	F+BUILla65QNNll66vtFkqKzpouFBQWsTPZq9Vso9dZDJfykNR3hZAhhZ8JrKJkm4DI=
X-Gm-Gg: AeBDietwPj+w5DxsVhZhv+m/SOFaSFHPiu5GRcZHbHm+uWe5RL3ahbaSeePlR4it1OO
	+3sgOWBNcMRnMEUUssIILPiNfIyKwY0vdZsbICILIn4jnenhC3gNdwR6mdHWi6T4FVolBnc/L4U
	wj61ffcxZsENipQ7uQTTiJtXUvNSHJRwy0NW5kCGOyFriuZZqnxlQ5gIpmgw6Al+WaHaoqAE/9E
	lblYK4bgYmn0xAvHB5szTM2LkcPMDNTWjvY99CfLkwDl2BWd7DLQAkVZW7aV0iFQy1wWh+VYeio
	twv4lJAU1eukqVoOSROWxSZFmYiGQ9WM/owe12gBh33NxvPGLTgL67QO4OpterIHPILzcGyzmZU
	y33AjWhleLkYfoIb1+L7L+GCMd9TrmL+dTvC36MYKgS6zDuMmoDA02Qqom6vbRgZEoOPHApZ5nY
	Klg0h6OlDUQhAOLOiEPE+PvPoRejcyvtGuaq6bThNp22xlNluhhLMFEEk7wZoUiH0Akp0Sl9ERe
	ro+lmgSdEqrEOkVig==
X-Received: by 2002:a17:906:478e:b0:b98:1129:51 with SMTP id a640c23a62f3a-b9c675492c5mr1034699866b.17.1775653681583;
        Wed, 08 Apr 2026 06:08:01 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9775:58c0:569c:bd74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3a6a48f3sm24687366b.58.2026.04.08.06.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 14:08:00 +0100
Message-Id: <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jassi Brar"
 <jassisinghbrar@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850
 mailbox
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
 <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
In-Reply-To: <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>

Hi Tudor,

On Thu Apr 2, 2026 at 9:42 AM BST, Tudor Ambarus wrote:
> Hi, Alexey,
>
> On 4/2/26 5:20 AM, Alexey Klimov wrote:
>> Exynos850-based platforms support ACPM and has similar workflow
>> of communicating with ACPM via mailbox, however mailbox controller
>> registers are located at different offsets and writes/reads could be
>> different. To distinguish between such different behaviours,
>> the registers offsets for Exynos850 and the platform-specific data
>> structs are introduced and configuration is described in such structs
>> for gs101 and exynos850 based SoCs. Probe routine now selects the
>> corresponding platform-specific data via device_get_match_data().
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  drivers/mailbox/exynos-mailbox.c | 67 +++++++++++++++++++++++++++++++++=
+++++--
>>  1 file changed, 64 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-m=
ailbox.c
>> index d2355b128ba4..f9c59c07558a 100644
>> --- a/drivers/mailbox/exynos-mailbox.c
>> +++ b/drivers/mailbox/exynos-mailbox.c
>> @@ -31,14 +31,61 @@
>> =20
>>  #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>> =20
>> +#define EXYNOS850_MBOX_MCUCTRL		0x0	/* Mailbox Control Register		*/
>> +#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*=
/
>> +#define EXYNOS850_MBOX_INTCR0		0x0C	/* Interrupt Clear Register 0		*/
>> +#define EXYNOS850_MBOX_INTMR0		0x10	/* Interrupt Mask Register 0		*/
>> +#define EXYNOS850_MBOX_INTSR0		0x14	/* Interrupt Status Register 0		*/
>> +#define EXYNOS850_MBOX_INTMSR0		0x18	/* Interrupt Mask Status Register =
0	*/
>> +#define EXYNOS850_MBOX_INTGR1		0x1C	/* Interrupt Generation Register 1	=
*/
>> +#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
>> +#define EXYNOS850_MBOX_INTSR1		0x28	/* Interrupt Status Register 1		*/
>> +#define EXYNOS850_MBOX_INTMSR1		0x2C	/* Interrupt Mask Status Register =
1	*/
>> +#define EXYNOS850_MBOX_VERSION		0x70
>
> Please consider defining just the registers that are used, to not
> pollute the driver. You may drop the unused gs101 definitions too.=20

Sure. Thanks. I was surprised how many unused defines were introduced
by gs101 SoC in the first place all over.

>> +#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
>> +
>> +/**
>> + * struct exynos_mbox_driver_data - platform-specific mailbox configura=
tion.
>> + * @irq_doorbell_offset:	offset to the IRQ generation register, doorbel=
l
>> + *				to APM co-processor.
>> + * @irq_doorbell_shift:		shift to apply to the value written to IRQ
>> + *				generation register.
>> + * @irq_mask_offset:		offset to the IRQ mask register.
>> + * @irq_mask_value:		value to right to the mask register to mask out
>> + *				all interrupts.
>> + */
>> +struct exynos_mbox_driver_data {
>> +	u16 irq_doorbell_offset;
>> +	u16 irq_doorbell_shift;
>> +	u16 irq_mask_offset;
>> +	u16 irq_mask_value;
>> +};
>> +
>>  /**
>>   * struct exynos_mbox - driver's private data.
>>   * @regs:	mailbox registers base address.
>>   * @mbox:	pointer to the mailbox controller.
>> + * @data:	pointer to driver platform-specific data.
>>   */
>>  struct exynos_mbox {
>>  	void __iomem *regs;
>>  	struct mbox_controller *mbox;
>> +	const struct exynos_mbox_driver_data *data;
>> +};
>> +
>> +static const struct exynos_mbox_driver_data exynos850_mbox_data =3D {
>> +	.irq_doorbell_offset =3D EXYNOS850_MBOX_INTGR0,
>> +	.irq_doorbell_shift =3D 16,
>> +	.irq_mask_offset =3D EXYNOS850_MBOX_INTMR1,
>> +	.irq_mask_value =3D EXYNOS850_MBOX_INTMR1_MASK,
>> +};
>> +
>> +static const struct exynos_mbox_driver_data exynos_gs101_mbox_data =3D =
{
>> +	.irq_doorbell_offset =3D EXYNOS_MBOX_INTGR1,
>> +	.irq_doorbell_shift =3D 0,
>> +	.irq_mask_offset =3D EXYNOS_MBOX_INTMR0,
>> +	.irq_mask_value =3D EXYNOS_MBOX_INTMR0_MASK,
>>  };
>
> I find it strange that the SoCs use different registers. Are you sure you=
're
> using the right direction? i.e. ring the doorbell to APM and not to AP?

Well, I am not sure I correctly understood the questions and comment. So,
this all was tested with ACPM TMU code with 3 temp sensors and it seems
to work and sensors react in the right way.

Downstream clearly does the following (see also [1],[2]) when sending
ACPM msg:

static void apm_interrupt_gen(unsigned int id)
{
	/* APM NVIC INTERRUPT GENERATE */
	writel((1 << id) << 16, acpm_ipc->intr + INTGR0);
}

I am aware that gs101 downstream uses INTGR1 in apm_interrupt_gen().

When I use INTGR1 for e850 then I observe acpm timeouts. Hence, out of
curiosity, what's the expected behaviour when/if I ring the doorbell to
AP (to itself as far as I understand)? My understanding that it won't
work at all in such case unless APM firmware does some very fast
polling.


[1]: https://gitlab.com/Linaro/96boards/e850-96/kernel/-/blob/android-exyno=
s-4.14-linaro/drivers/soc/samsung/acpm/acpm_ipc.c?ref_type=3Dheads#L423
[2]: https://github.com/samsungexynos850/android_kernel_samsung_exynos850/b=
lob/0af517be2336bf8e09c59d576c4c314446713101/drivers/soc/samsung/acpm/acpm_=
ipc.c#L426

>>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>> @@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *ch=
an, void *data)
>>  		return -EINVAL;
>>  	}
>> =20
>> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>> +	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
>> +	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
>
> Use FIELD_PREP from <linux/bitfield.h> please. You will use a mask instea=
d of
> a shift.
>
> I would rename irq_doorbell_offset to intgr. It aligns with the register =
name
> from the datasheet. You won't need to prepend _offset to the name, we alr=
eady
> see it's an offset when doing the writel().

Sure. Thanks. Let's use FIELD_PREP.

"doorbell" naming was chosen for readability and maintainability reasons.
It seems to be more generic enough name that better reflects the workflow
of what's going on in ACPM+mailbox machinery. We can rename it to just
"doorbell" for instance.

From platform data it will be clear to which register it is set, INTGR0
or INTGR1, to align it with datasheet (which is closed anyway).

Regarding intgr vs doorbell name, the intgr is a bit unclear for a
reader if it means interrupt generation register or something else.
But if you prefer, I can go with "intgr".

One more option is add a comment, smth like /* Ring the doorbell */
before that writel().

[..]

>> @@ -133,7 +194,7 @@ static int exynos_mbox_probe(struct platform_device =
*pdev)
>>  	platform_set_drvdata(pdev, exynos_mbox);
>> =20
>>  	/* Mask out all interrupts. We support just polling channels for now. =
*/
>> -	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0=
);
>> +	writel(data->irq_mask_value, exynos_mbox->regs + data->irq_mask_offset=
);
>> =20
>
> and here I would s/irq_mask_value/intmr_mask and irq_mask_offset/intmr.

Ack. Thanks.

Best regards,
Alexey
