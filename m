Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483973A453F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 May 2026 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505475; cv=none; b=dqX8IagSFT32hyRKBpNElcj56BvVue1gMeQEmi/STuNjjOfftsptIqZv6q/BgVNdr1wWurkaIHvVxR5UkvkOrJdp+RpxwwI4xLP/Rn3KvB3VcVRFEIQDMdoVnGsbndm4Gu2JAsuAIyaqh2o4dxhnrlv/USRD9N6otpdak/V897M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505475; c=relaxed/simple;
	bh=70pRwaawB6fSxyFjY9MWQ2Wj667Hq0JjSk0kpFgv0o0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=uHjt66xbD5aJFTwHIkPqJD323WD3jsn6ehdjh3B/GfH8A7r5d/QHlmmBTOuDsMKOhA45tyci68yoXRdEfLG5rSHDRwoI0hlYhMN4DcRL4R2u0UPqP8iHlo3NH+qluSJbtCGiu2iv68a3icuu6E5zx6TI39war72mcJNHSSjI8c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OKiZ5YAY; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OKiZ5YAY"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso3409327f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 May 2026 06:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778505473; x=1779110273; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpBr89JbDstdIUMvCB+UAEmSrotPv1wv1lCMdlQElUc=;
        b=OKiZ5YAYE5GosIW9lKyy4U4IQ6LOmSN909YdrCMzeucPYB/sKJ0yPm3hKVCQ9vW2nT
         G3lDMvs8v/iwvkUo4xCLNSvxsaP54sJRcysgPeBBl695/hAMiqidXxRNaT/rwRit4Amd
         RYgCS/ne+0R+xfxke34UlwcRq09huKA6yB2YXd+ftFPx1HBtvSOq/jEzogZTFXd1TWCd
         lY1SHqHJPv+q2pSEFRpUWePdeSvdBPO5hpLbE9qF4pPjcGae3WGqhW0ypO6JrCxHXcdT
         kiVNKNppC1oVavuE+0/xoLM1ZPqELlB33VkV+uWicfO6RlbfutFqaTgxJpNdDVO6W6Mf
         EHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505473; x=1779110273;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VpBr89JbDstdIUMvCB+UAEmSrotPv1wv1lCMdlQElUc=;
        b=HgKoP+26+AzpMfeQkez2c1KCEVzmZiYLrroh6e20yUPLkTzP9sWb7oqu2UCwGjw8xM
         gzYC5eOXkTRSKuP9IIGJ7GZPkdUzlj8eqJZfaS19JceVBFQuvgVhgaH2922LWASdpLll
         wDjAW2WDu9gU1fwd/6ddxIXNktdNZoFHQ7XJ8V+g02BGBApdhTL9GD23SvuHuakdZLsy
         M3u8XvL5ZqWGMLa9p05tbSLAHX4u6zlSwZvd1189MdV9630VCp+QAvJSEKHF/nUNGzRo
         8u1QX7CQIKvgHrHsg6FdOlyiAk5xGkyJc/opYHPXGXLW0oDcrJ6nYpyZm/uoN9xs8BUI
         OLUA==
X-Forwarded-Encrypted: i=1; AFNElJ+5kEBqHSScNLgAogT6LIJAJ1VC+3rCbVmjjR9vb2sRgGxPNtkXpqZQmPmA1cJmDAZTOQFT38ejBFuocaufZe3z0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0rQ0D4vpqz/Da+dlHnd9N/uF8Fm18rEjDfQso26XUSFfG/bQ
	ETLaFFhA7+gXv9lGHU+4XmWllK57NYs2BGNiRdzeXWY+iBzM59njgbVvfeOuofXfldo=
X-Gm-Gg: Acq92OG+/Bdz0Imtlm4ojyRKbZiXTVodr57fyp4gHfIFDDrYl9GKdLfJ/AJbQoTlr19
	2Ai8ZI3lYCCN/xwFnDiKK76W4l/XKj8S/hxzJzc6KUdRfmIg+FwEcltyqU/kpoXtLYDgbeYx2d2
	H9Krd7nlbgAPNfNooqsUqGKUbnwxAUw0eY0dEIOz/bpEF2kp/6i8WzxmdL2cz8JcWxZduFYkHpN
	DQl7VFb2Frr7c1poeX2KdajFn5gL8yHDsO72R67Ko1FGKygTFNn5OyNeb8ekTSr9HetqMKLQ2Ht
	QTnCKCSkjn/xnyvWh/6WlyAfLYbeKtDUqiH8PNIZzAiS8xSW3Zf8RFfK2Od8KJlgqfErVS6TVDm
	uBwIAcTll81c+CRs+XYenSaWRuyi86IlMc3gKhLHqUGDsMqotqDDEvuW6zEVsp+cWpcgWT9Vk5A
	dY3WnfBUXWvJnBYO1iZshTB1kEKpPJL7Fx9+nXk+VJoXOiyLcwCjuh/HYfpgctPGsuNzkpWe1lp
	BSxrf/xqRzWVLARgw==
X-Received: by 2002:a5d:5d0b:0:b0:43d:c2bc:21b4 with SMTP id ffacd0b85a97d-4515b525d65mr37422228f8f.16.1778505472478;
        Mon, 11 May 2026 06:17:52 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:5acc:6281:995e:547f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120f1f9sm25688565f8f.24.2026.05.11.06.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 06:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 14:17:51 +0100
Message-Id: <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <peter.griffin@linaro.org>, <jyescas@google.com>,
 <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
In-Reply-To: <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>

On Thu May 7, 2026 at 9:31 AM BST, Tudor Ambarus wrote:
> On 5/6/26 6:13 PM, Alexey Klimov wrote:
>> On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:

[..]

>>> new file mode 100644
>>> index 000000000000..c68d60b4c0b3
>>> --- /dev/null
>>> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
>>=20
>> [..]
>>=20
>>> +static int acpm_tmu_to_linux_err(s8 fw_err)
>>> +{
>>> +	/*
>>> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
>>> +	 * capabilities. Treat zero and all positive values as success.
>>=20
>> ACPM_TMU_INIT returns capabilities inside designated error field?
>
> yes

Heh. Okay.

>> What about other messages/commands? They just return error code there?
>
> all the other commands either return -1 for errors, regardless of the err=
or
> type, or 0 for success.
>>=20
>>> +	 */
>>> +	if (fw_err >=3D 0)
>>> +		return 0;
>>> +
>>> +	if (fw_err =3D=3D -1)
>>> +		return -EACCES;
>>> +
>>> +	return -EIO;
>>> +}
>>=20
>> Could we map these return values with better granularity instead of
>> returning -EIO for everything else that is not minus one?
>
> I think we're good as we are now. The firmware returns either -1 for erro=
rs,
> zero for success, or BIT(0) and BIT(1) for TMU_INIT to flag some capabili=
ties.
> I can't tell if there are other commands that return capabilities as well=
,
> or if there are other capabilities for TMU_INIT, I don't have access to t=
he
> firmware code.

On Exynos850 I see more than just one returned error codes. I definitely
see 0xfe and 0xfd at least. I don't have any data to confirm that ff
maps to -1 and fd-s, fe-s to -2,-3 though and what they mean. From my
experiments I suspect that 0xfe means that call/msg type is not
implemented or not accessible and 0xfd means that passed parameter is
wrong or incorrect or not found.

I am also not sure that I saw 0xff-s but, well, maybe that needs more
experimenting.

Thanks,
Alexey

