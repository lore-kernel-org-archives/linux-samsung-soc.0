Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93E03FCB0B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119641; cv=none; b=hvNjPlSBVBgkYa1/dh1x27/NACtQe5CfRbw8nzUnzOY61s3V2AQc4cY+dXX6mTFLkl/4wFf5lb2jtPg8Qp0V/Ii8aylmJjaSGSPnryhJ4Gyq4+4YuzGnnyW7NjLt0aexqQhkp3McN2nZhbibZYwzjzk1dMO1++NtHrrPkgC+rwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119641; c=relaxed/simple;
	bh=qinlbRUsrsoI3G0Idzy3OLNIe6OWIwROy5kkyHNzpg8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ECD1Ixyx7zoipMbvjZJ7VhDobUFE23+QT0+rZrEf8M8b7RNk229kZjZDtPBtynxHBlctOQjv8UH4BCU76Rfeow+yBxXPeZ0OI6EF0lJJIEUexhhjsSKMkWzQywh+1dJg0TGN3WkY8avK/Vw+32XMQn1Cn6BF/EScn/HiZ/n1xbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rYKdl985; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rYKdl985"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bd01481e592so352533466b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2026 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779119631; x=1779724431; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6XeGKNj12ctbAKTuuVJw+MBHLoP2SCgG7eKfZnzwJI=;
        b=rYKdl985N2ORaot8HwYAj5AYxhmRbo67hSVvX6UiqeLYV4htENI0D9JwI6V1Fd3a+Y
         OIzhDUv9+qdmcaF9XMLwLVdvRSFSMaEU0PdbVelBsn7n1dSlWyeXivlxoTPHy5f2m25a
         VpBqXz1xjX9evY9Jfa6/sPYhfORQtphZABox28h9xqoq7VMa3iQCLuAUWZY3v1QSft0f
         t15uk96UeTMWHwfddqlElZQqBMsKpIgJxFRGUKCNq2wIN+9kPvaHm03hEezHenWqrbgL
         rKEG0qvMpMrj2VBWNL9ht0Fnm6t0j7IJjIjyvissa7UU6PslUhEDb280ic4O2LB5SrcI
         i2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119631; x=1779724431;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6XeGKNj12ctbAKTuuVJw+MBHLoP2SCgG7eKfZnzwJI=;
        b=qisPkJNm2Roq3w0GG06M8QD1Q2GrKYaboCyacKAeRCmz2JVbf/1/uYZ/aS8aNOF4FC
         scxjeVFX0W1IM833Fdp36vDjugMNp/v0096HzdJzNlGDZYvzL4xvJZ9uTTPuH5CdEiZm
         YfWKd9I85J/hwaQjp1ya+gBHAYVbFVjV9oQJBU14Sxv6F1S5YPboV4ASLVcfRHw6K8Ap
         uK4r9jvvTCeZBAz9qrAteJtL1i/AG9ytva63UsvrShbxRbEVBtjcVGqhZFYiXmLqaSKV
         8cK693pzXC4StTLA7nJsXp5Mwa04DzEeLizs8PQpcmDglF0uCZUY5pA4IqNxXQ3+Vruf
         m9GA==
X-Forwarded-Encrypted: i=1; AFNElJ9tegu25PNFPp9MkZTpUHm2zYrqjRojzt+foT8MOEth5lRYevc6b34S+YCCyjwO0brDQGAXikyWROb588VVC4sZgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsDy0EfvBImy3X/A9i7da2UCYXSw8V0UkiuTGzM31rU2wmxuV/
	4DhieaKv1qhGZDwMblZDrhELSJ1rhEuEH8XfYk71uUHzqX+/7HiLzGWD2ghyj88RTxE=
X-Gm-Gg: Acq92OHZ4sYRZ6r9NKdoV5tkgvDGjMeOx6/F6RrKRM4CqWvsjiVsitywo5UbVclAEg+
	fMXqPDKjlTfvNUdoXvMxmPDMtmVD59P0wQho6wClY+Z1QCoF5fBlh53vZnPnugTve2wBPOOK72s
	wbMDBLoPPsy7OuW6tgB6GFElpSlF/0vT3lRPcVKPgw9KK9yo5u7wHsvaHuKcsd0dejSl4xmI+1r
	evAdomrkzAxT5kKR2xPLJyu9M5A+6Cc6NF03yYPMsv3X4bhHpjvQkqHWTQrcQXA+6fQoSPEIICC
	1/VPk0TflYlDNe62YEGzUMdXTWcYY4rO5fTHodbWBpYxf0IECwIOwLRed/RPwDYmyCCxAP+DuED
	pL8liiCnOJ9bn8S4+YgdlND6DbJcIV4hBLU/KWNywErriU82IPmKJezXTA1vyA9XcQkFKsB0w63
	ri6hC7oQLhWFacgmv9+CJbLe01JxLlBQScBnNHPJ+4Tw2GkrwNh5fZO/YdlPiDBBaOcnRcsCmYU
	tN8mad5B9WqqWTnWw==
X-Received: by 2002:a17:907:d06:b0:bd3:331f:3ae7 with SMTP id a640c23a62f3a-bd51792a1c3mr904523566b.27.1779119630526;
        Mon, 18 May 2026 08:53:50 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:33b7:a835:bc95:259f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dec855sm586166166b.37.2026.05.18.08.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 08:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 16:53:49 +0100
Message-Id: <DILX9UGAMXLN.2WVL25FJ87HDK@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "Juan Yescas" <jyescas@google.com>
Subject: Re: [PATCH v3 2/2] mailbox: exynos: Add support for Exynos850
 mailbox
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sam Protsenko" <semen.protsenko@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, "Alim Akhtar" <alim.akhtar@samsung.com>
X-Mailer: aerc 0.20.0
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
 <20260429-exynos850-ap2apm-mailbox-v3-2-8e2719608c46@linaro.org>
 <9b6fce56-6a94-44fe-ab55-5394ec6065e4@linaro.org>
In-Reply-To: <9b6fce56-6a94-44fe-ab55-5394ec6065e4@linaro.org>

On Thu Apr 30, 2026 at 12:01 PM BST, Tudor Ambarus wrote:
> Hi, Alexey,

Hi Tudor,

> The abstraction is clean. Few comments below.
>
> On 4/29/26 10:00 PM, Alexey Klimov wrote:
>> Exynos850-based platforms support ACPM and has similar workflow
>> of communicating with ACPM via mailbox, however mailbox controller
>> registers are located at different offsets and writes/reads could be
>> different. To distinguish between such different behaviours,
>> the registers offsets for Exynos850 and the platform-specific data
>> structs are introduced and configuration is described in such structs
>> for gs101 and exynos850 based SoCs. Probe routine now selects the
>> corresponding platform-specific data via device_get_match_data().
>>=20
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  drivers/mailbox/exynos-mailbox.c | 59 +++++++++++++++++++++++++++++++++=
+++++--
>>  1 file changed, 56 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-m=
ailbox.c
>> index d2355b128ba4..11657dd475c0 100644
>> --- a/drivers/mailbox/exynos-mailbox.c
>> +++ b/drivers/mailbox/exynos-mailbox.c
>> @@ -31,14 +31,52 @@
>> =20
>>  #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>> =20
>> +#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*=
/
>> +#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
>> +
>> +#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
>> +
>> +/**
>> + * struct exynos_mbox_driver_data - platform-specific mailbox configura=
tion.
>> + * @intgr:		offset to the IRQ generation register, doorbell
>> + *			to APM co-processor.
>> + * @intgr_shift:	shift to apply to the value written to IRQ generation
>> + *			register.
>> + * @intmr:		offset to the IRQ mask register.
>> + * @intmr_mask:		value to write to the mask register to mask out all
>> + *			interrupts.
>> + */
>> +struct exynos_mbox_driver_data {
>> +	u16 intgr;
>> +	u16 intgr_shift;
>> +	u16 intmr;
>> +	u16 intmr_mask;
>> +};
>
> using u16 for intmr_mask is slightly problematic. Down in the probe
> function, you pass it to writel():
> 	writel(data->intmr_mask, exynos_mbox->regs + data->intmr);
>
> writel() explicitly expects a 32-bit (u32) value. While the compiler will
> implicitly promote the u16 to a 32-bit integer, memory-mapped I/O masks
> should generally match the width of the register being written to. If a
> future SoC requires a 32-bit mask (e.g., GENMASK(31, 0)), the u16 will
> silently truncate it.
>
> u32 for all fields is generally preferred in kernel platform data structs
> for padding/alignment reasons.

Sure. Thanks. I can switch it to u32.

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
>> +	.intgr =3D EXYNOS850_MBOX_INTGR0,
>> +	.intgr_shift =3D 16,
>> +	.intmr =3D EXYNOS850_MBOX_INTMR1,
>> +	.intmr_mask =3D EXYNOS850_MBOX_INTMR1_MASK,
>> +};
>> +
>> +static const struct exynos_mbox_driver_data exynos_gs101_mbox_data =3D =
{
>> +	.intgr =3D EXYNOS_MBOX_INTGR1,
>> +	.intgr_shift =3D 0,
>> +	.intmr =3D EXYNOS_MBOX_INTMR0,
>> +	.intmr_mask =3D EXYNOS_MBOX_INTMR0_MASK,
>>  };
>> =20
>>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>> @@ -57,7 +95,9 @@ static int exynos_mbox_send_data(struct mbox_chan *cha=
n, void *data)
>>  		return -EINVAL;
>>  	}
>> =20
>> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>> +	/* Ring the doorbell */
>> +	writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
>> +	       exynos_mbox->regs + exynos_mbox->data->intgr);
>> =20
>>  	return 0;
>>  }
>> @@ -87,13 +127,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struc=
t mbox_controller *mbox,
>>  }
>> =20
>>  static const struct of_device_id exynos_mbox_match[] =3D {
>> -	{ .compatible =3D "google,gs101-mbox" },
>> +	{
>> +		.compatible =3D "google,gs101-mbox",
>> +		.data =3D &exynos_gs101_mbox_data
>> +	},
>> +	{
>> +		.compatible =3D "samsung,exynos850-mbox",
>> +		.data =3D &exynos850_mbox_data
>> +	},
>>  	{},
>>  };
>>  MODULE_DEVICE_TABLE(of, exynos_mbox_match);
>> =20
>>  static int exynos_mbox_probe(struct platform_device *pdev)
>>  {
>> +	const struct exynos_mbox_driver_data *data;
>>  	struct device *dev =3D &pdev->dev;
>>  	struct exynos_mbox *exynos_mbox;
>>  	struct mbox_controller *mbox;
>> @@ -122,6 +170,11 @@ static int exynos_mbox_probe(struct platform_device=
 *pdev)
>>  		return dev_err_probe(dev, PTR_ERR(pclk),
>>  				     "Failed to enable clock.\n");
>> =20
>> +	data =3D device_get_match_data(&pdev->dev);
>> +	if (!data)
>> +		return -ENODEV;
>
> you shall move this first thing in probe() to avoid doing allocations
> gratuitously on null match data.

Ack.

>> +
>> +	exynos_mbox->data =3D data;
>>  	mbox->num_chans =3D EXYNOS_MBOX_CHAN_COUNT;
>
> EXYNOS_MBOX_CHAN_COUNT is globally defined as:
> #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>
> Does the Exynos850 have the exact same number of channels as the GS101?
>
> You may move num_chans into struct exynos_mbox_driver_data alongside the
> register offsets so each SoC explicitly declares its channel capacity.

Here:

=3D> md 2040000 <--- sram_base + initdata_base
02040000: 000063bc 00000007 0000650c 00000013  .c.......e......
02040010: 00000000 00000007 0000000b 0000000e  ................
				^^^^
02040020: 00000000 00000000 00000013 00000009  ................
02040030: 00008000 00008008 0000800c 00008010  ................
02040040: 00000010 0000017f 00007800 00000080  .........x......
02040050: 0001f800 00004000 00000300 00000010  .....@..........
02040060: 66633931 20613261 65766164 00383130  19cfa2a dave018.
02040070: 00000000 00000000 3a393000 353a3133  .........09:31:5
02040080: 65462034 31312062 32303220 00000030  4 Feb 11 2020...
02040090: 00000000 0000001b 00000002 00ff00df  ................

So it looks like the ipc_ap_max field is equal to 0xb.

[   12.972113] exynos-acpm-protocol firmware:power-management: calling acpm=
_channels_init
[   12.972216] acpm_channels_init: acpm->num_chans=3Db.
[   12.975541] exynos-acpm-protocol firmware:power-management: ID =3D 0 pol=
l =3D 1, mlen =3D 16, qlen =3D 15
[   12.976522] exynos-acpm-protocol firmware:power-management: calling acpm=
_channels_init
[   12.979336] acpm_channels_init: acpm->num_chans=3Db.
[   12.984133] exynos-acpm-protocol firmware:power-management: ID =3D 0 pol=
l =3D 1, mlen =3D 16, qlen =3D 15
[   12.993849] exynos-acpm-protocol firmware:power-management: ID =3D 1 pol=
l =3D 1, mlen =3D 16, qlen =3D 3
[   13.001756] exynos-acpm-protocol firmware:power-management: ID =3D 2 pol=
l =3D 1, mlen =3D 16, qlen =3D 5
[   13.010519] exynos-acpm-protocol firmware:power-management: ID =3D 3 pol=
l =3D 0, mlen =3D 16, qlen =3D 1
[   13.019317] exynos-acpm-protocol firmware:power-management: ID =3D 4 pol=
l =3D 1, mlen =3D 16, qlen =3D 3
[   13.028073] exynos-acpm-protocol firmware:power-management: ID =3D 5 pol=
l =3D 0, mlen =3D 16, qlen =3D 1
[   13.036805] exynos-acpm-protocol firmware:power-management: ID =3D 6 pol=
l =3D 0, mlen =3D 16, qlen =3D 1
[   13.050945] exynos-acpm-protocol firmware:power-management: ID =3D 7 pol=
l =3D 1, mlen =3D 2, qlen =3D 1
[   13.065791] exynos-acpm-protocol firmware:power-management: ID =3D 8 pol=
l =3D 1, mlen =3D 2, qlen =3D 1
[   13.079592] exynos-acpm-protocol firmware:power-management: ID =3D 9 pol=
l =3D 1, mlen =3D 16, qlen =3D 7
[   13.088398] exynos-acpm-protocol firmware:power-management: ID =3D 10 po=
ll =3D 1, mlen =3D 8, qlen =3D 1

That's what sram + initdata provides but I guess these are implemented
number of channels of ACPM firmware (when APM communicates with AP CPU).
The mailbox hardware register though can process or consume 16 bits or
in other words HWEIGHT32(GENMASK(15, 0)). I guess this field should
indicate hardware capability of mbox hardware like max number of
possible channels? I'll change the code to use HWEIGHT32(mask) of
corresponding register then.

Or should there be a call to acpm firmware driver to query the number
of channels? Or should we get it from device tree?

Does gs101 have less than 16 number of ACPM ap channels?

Best regards,
Alexey
