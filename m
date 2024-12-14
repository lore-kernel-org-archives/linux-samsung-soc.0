Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9485DEC0;
	Sat, 14 Dec 2024 14:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734187473; cv=none; b=FMUEhh83YChd6cbEusSocOZheqY9ULlV/YqvNk+T/6zCFrYpg26NBPdUetO9Es4jcrTibK0nMVZnsu84kgvup8si2rBJult7Ai3RGchuSCWrUpqalxmFBql2UW04+znQ/uhUGlZ/alc77NsqG3JY1rF7mQEEapExge5QFILAEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734187473; c=relaxed/simple;
	bh=V/4hveNXnTzs2sR3Cj7CGb+By9JCXCdycd/ln7cLcV4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=S31E2Z14BCnoUH0wUPkysq9OOzkBXvLE9c90UCcAiv6ThF2w2BZnJRKdjlmSwlhC4z7Nyc2g6CdbgQmfif2tk2X9VeUuzl9bPylDiFr6GG45aK+XUcyOTkwmD0aSSfLOQukgLCPXiQ/QOnFVByYGQRVcb5OP+Ek2YQ0n9zcr/do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=YkkU9BXU; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="YkkU9BXU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1734187440; x=1734792240; i=markus.elfring@web.de;
	bh=zhSHKp1jxoNkU7hyFpf2kS1qX2yR7ZASZZoIXCxrPS4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YkkU9BXUgztAvQfYtLxXCmPEMR2/e1NZzJ0MGqY2XUM3xa7rN8XppNExjz5fMBzb
	 D2yDMPE5M8C0+zHT0wH+7qjpCczjZ8bCjmIf/uYzzfNX/wqa7IwR52aFJUPvTzbd1
	 FLml4OcyZGvhj5DjtrXERcAiVFkxoFHhxDszPtcGuQOmVh5Enz/9Vus9MDmPXUIC5
	 8wAOH0ZAWv/RwxJ7TTOQ89PtRq4UaT8Y9snlUNQr8fVoH7SOXa6AeZxlMG8s0hRSd
	 SVSRvJtDLDmN+WcQRkXkjt73Ikw86XMNe0L/aY4RbDrjj2DF8I8sXZQDFuqtZAKpO
	 iHSIuRzviO8xcTxMVA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.70.57]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mf3qY-1tpSXF41Vq-00dgAK; Sat, 14
 Dec 2024 15:44:00 +0100
Message-ID: <44419be4-65b3-41eb-a696-cfefae84a423@web.de>
Date: Sat, 14 Dec 2024 15:43:41 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Maksym Holovach <nergzd@nergzd723.xyz>,
 Markuss Broks <markuss.broks@gmail.com>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
References: <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
Subject: Re: [PATCH 2/3] soc: samsung: Add a driver for Samsung SPEEDY host
 controller
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kSs8gYPdVRGvnF2Xk5QnP0ZIbQ1n6Z9KVxpWNOEeZ50ISG7PUYA
 mjN6tq83OreQiN9pDPdt9NmiP4sosI4rXBevsCKfcoPTRG4Vxmq3th7agMUBhslrSz1NmkX
 FOQ/LXt1Gs8Luldq5e7IW8zOZpMFWv9jdzd8VjWAZUWw4UwIb6VW/nEwJLv8OyqaDiBiBah
 8phBX+0h8PbIhjA9FgDpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZvnPYnJTGNM=;H3nYxlU3VlEwdOlR9qYrS5Ut6fE
 Wea/z7R24moiT4HMqTyR06mku3iOWEjjcy1/H8MczfTEmkq7OmBU3oDv7ZJEtLIr66j8zIxLa
 xKfo91wZhUsAM0VcztLeYQsswmuAFlj/2LlF/6slISmj/KwS8gB6FdOjmiDJx2pl3WAnu8MAy
 +iNCUo27Cisfj/R+q3lwF7ByVry75r5juxdjZAFpWmDzoQkTOnFRJj8xV+aLbP6bIBcisnV+d
 OQamjnBuKt51XGN9Bs8S6must0CHh+1yDv//gDqLYovmEnDl02GMFjMnq7bej6lzCQNkUVxOE
 UglA8DCWcNkbRZHL3ySM1yKvkeJPFc4nL9JmkpwjM4SNruIMLVHjC5cR7iau8J/u+D63c2Qmq
 QddAPimuz644KujsfYNKwQ9YcHL5xldpeGXyfkjhuvP7AbN0aoOH7C2S1oOopkTg7W0Hm/lw4
 z/uNdETA05GWbCwptB0a2rLKkrhEkbX3fYdOvLRwotHuxEd5zX/YdElK+eU+M/EuIs+coJLns
 yj4LNwTdSLy+yIH2i7jYQ7IK2s1vbAknRCcT+Y6zBVx/hG+Ypgl+zfjGjeJUizt1qUBVXLNw5
 Sdvb+fN8CrMDEkJhARAPttNcjqrsLqcTBbf4EwcFWjCeWByHaAH7+qibRRiTxo0mVPudOYWta
 EZiA+MliZs30jBq2wk8sydCtNOgXozdfSJpiGHD+v2BCVw69AOBQDusEMFOGUV4J/S7F4ilge
 VhVLeuKVzlmkp8pmwjOBfA3uphIZQmNZKg8BLfIHNPo//wmU7ZiWiq6lfpfeH/dYA3Vc9j4//
 UhVqfj4DAwk/jlIqCAnifg7IYu1MncYC6/aiG4qEN/R7e3c5lGz42xJfbl5URSxj89giS+7Yo
 7L+BrO4oIjLcQyYptWGvRhEyEkaVVL8VvQi8vY4ZqpNpD/0VozC0vfUg5RhbxU8YFWUrUjZgZ
 YKvM0GR+4Ad6ipsIbA6s+w3u7pxkRzuOX1i0p2mjFO9aYxOmBwPsJMr2cxEbgxHU+d9JoyLjZ
 GQg6sjkW2GcQqML4MQXI4ZGRc3dDkMWUm6aP5RU16bV8IxowLGevu5hKwKqfNM9U6+7fikNLv
 3/KdvjPr4=

=E2=80=A6
> SPEEDY is a proprietary 1 wire serial bus used by Samsung
> in various devices =E2=80=A6

You may occasionally put more than 57 characters into text lines
of such a change description.


=E2=80=A6
> +++ b/drivers/soc/samsung/exynos-speedy.c
> @@ -0,0 +1,457 @@
=E2=80=A6
> +static int _speedy_read(struct speedy_controller *speedy, u32 reg, u32 =
addr, u32 *val)
> +{
> +	int ret;
> +	u32 cmd, int_ctl, int_status;
> +
> +	mutex_lock(&speedy->io_lock);
=E2=80=A6
> +	ret =3D speedy_int_clear(speedy);
> +
> +	mutex_unlock(&speedy->io_lock);
> +
> +	return ret;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&speedy->io_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.13-rc2/source/include/linux/mutex.h#L2=
01

Regards,
Markus
