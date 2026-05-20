Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF49D379EF5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2026 21:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779310884; cv=none; b=P96SthvXLfhOI9gZAO3BNQzsuRjgF1qhchVOoeRvZM+d4AMr/MX3uD3yl1My903Ci2hPjttqDgsAZD1oSlfNtzq9CkZfG5VhYEYbu5si+nhOA8K4zEFv+g2tyeAeJTdt9YokuEzBtzw4/gPFp8tOWzGRKnQLScQU944V+i1c+80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779310884; c=relaxed/simple;
	bh=9hgVEVQXcU4FuyUUNnkUzIz33hv8SRF0xUI91RTLQ6Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eoWGpbsImOuhdxf/Mz1RZuDauNLxPDv+5XIxF8JSaNXr2A0FxJvzzkrKtqAWsa0ZFkKvfldzYAGZgU2tq+G7Z5v3hbGVvXqSfVj3P777vySoiqkbZv7cIaNX47PgzwMa1NkF4ryYDc6A1CRsHH+vhY3BpA7GpVdxslIl3F7W3mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aic1Y9RX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aic1Y9RX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso40347295e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2026 14:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779310881; x=1779915681; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNWw9DWW+f/uHjT/RqJlGuJEj3EDU+LfC71q1l4z5Ng=;
        b=aic1Y9RXov/dOudrSLpENDu1ghrssIPtz+anGrFNmzr04T5ifA50Cg8Hy7IUTyyWQ1
         05LKeJEJNWRgk6RQDjhhHmv10S4w6JMELUvoSkCm1y1eBewT+5QzOzeKu9WGk0aA+9Jp
         JkHI05sBxGhRMyTQygG0sZzvBjx1HDJamI2ZCHhJAUvcNyHxFBeZ9X509TNQb2T1i7qD
         Ff4XBojMOaBqn6+3p4WW5rxxb0oh5MXt3P7RPy2zXIY4aYqjBsPvMjVE4Dh8IJNFeWB1
         dVaGbk1xU5NJNvxfBWDc9KBmpY/i4mmwWPcWqq3J97/Yw51XWkhFZ+0fN6eaekcoNqDv
         6+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310881; x=1779915681;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNWw9DWW+f/uHjT/RqJlGuJEj3EDU+LfC71q1l4z5Ng=;
        b=snXSa+djoSIMOIkEJOer9jJLxX73CsSnkEVMsd/0dbcRrrQeFP5Pwbwvt0vv509Lmn
         ZenjmNdmNVQPy5/bklhsLlbzAn7h+dtMAsVjq5ZkQH/tbH4PRkXwfK+9tAHVGWitUzWs
         tGYX5z9pvyqdAO7MqrE0SKPamB/C5V/lN25+fwmEPLZYc2vjACnUj9sAEziSZKfoEjdC
         xEceqrFDfufIi2guBA8nHmDnwGCs8Tdug3osPH+bf7ZcpTrYPFQ4w+cHorkcYhffmosE
         4uh3p6QNZwtSU6QMLZcwJf4JU7ZgPoUmakDZs/ULHu5lIf/33H0KSiqt+TIAWCqtJXq6
         abmA==
X-Forwarded-Encrypted: i=1; AFNElJ/WDZIaAqiW7xgii+qJ3aNxMLYCBX1UJ6FsNdF2qyo0LKrhF7MfYzAg6lsav9ofIl6FA3DgVkfn0O0TxELUPJ00ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGea6Tk6dNjIB4VxTWW9dGDUZCOAaa2pdEWMIAmxeagCcLFu0B
	924uWsgxSgWDjheddQkv8rbrOu6DyAkMi6nODYbSivaotmFT8u4tyVfWzHjRPCOBDM8=
X-Gm-Gg: Acq92OGb49uGVWkmUK1dtBxPNwCiOeiS1lk+wCv/0QlfoqlO66vA3lMjGWSctf/kiJp
	i9jlf0vPqbiAHwjm0OPCGBuiMYDAkFuW9knRlGRn6oZosDy25nyXwYY/qTvQHLXCc3LxvGxci60
	x+iupn1LRgpaL2UiiiqMz0blfExtQpAhm0iYmPU5boa9LC1OwYCjniVjgSzgDhmzZ298kraxOFn
	Iz03TQmjmY7PjqOK0DHUtoJUNLQ+AjoXp4cWd/YLupSK+i3Z/yKLt7mve5ZAbG+o5rmA41sZjnG
	MAb02WrQ1TnNsDyrHT3kV0Btx3G8cd0/vdbkDrhHO27xHYe5R2GG1G9wEfOC/Oa/v5sVQBen1/0
	goLgAOXjCHV6Zbx23Pbg3/BJRJhd3BoErSgf7O2/mTN2bUHIVAnS5r8UqN33WJ39HfVibewv3Df
	ZlAoW8LpdAJm+6+qyS6Mxxlwd611L51U7MkfO2ZudrNrLYJhaKRnQVC/LbaVnY2gheKsOpNngPq
	t0Dyq+Ktk8D5g==
X-Received: by 2002:a05:600c:17d1:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-48feea9dda7mr217316295e9.17.1779310881027;
        Wed, 20 May 2026 14:01:21 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c45734sm849305e9.11.2026.05.20.14.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 14:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 22:01:19 +0100
Message-Id: <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
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
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
 <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
In-Reply-To: <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>

Hi Tudor,

On Tue May 19, 2026 at 4:46 PM BST, Tudor Ambarus wrote:
> Hi, Alexey,
>
> On 5/18/26 2:24 PM, Alexey Klimov wrote:
>> Thinking further about this I'd humbly suggest that even
>>=20
>> 	if (fw_err >=3D 0)
>> 		return 0;
>>=20
>> 	pr_debug_ratelimited("ACPM tmu call returned: %x\n", fw_err);
>> 	or pr_debug(...);
>>=20
>> 	if (fw_err =3D=3D -1)
>> 		return -EACCES;
>>=20
>> some debug message would do.
>> Perhaps we need some convertation, for instance as it is done in scmi
>> code (scmi_to_linux_errno(), scmi_linux_errmap[]). But I don't have any
>> data for mapping acpm errors to some human meanings.
>
> I did that for the pmic helpers. I don't need any debug prints for
> gs101 TMU as I have clear instructions from firmware: 0 for success,
> -1 for error.

This doesn't look like a right approach for upstreaming a ACPM TMU
framework.

You are trying to submit a gs101-specific implementation masquerading
it as a generic ACPM TMU framework, while explicitly pushing the
refactoring work onto the next developer to add support for other
SoCs in this generic ACPM code.

The ACPM TMU protocol implementation on Exynos850 is different: it uses
different error codes, and half of the calls in this 'generic' driver
are not even implemented in the Exynos850 firmware. Relying on a
hardcoded if (fw_err =3D=3D -1) in a driver named generic ACPM is broken
by design and may silently swallow critical firmware errors on other
SoCs.

What about such options below?
- rename the driver to reflect reality: rename this specifically to
gs101-acpm-tmu-something to reflect that it is tailored for gs101-s;

or=20
- abstract the firmware error handling paths through driver_data or
a dedicated ops structure now, so that other SoCs can cleanly hook into
it without having to rewrite the logic later.

Maybe we can utilise build info date from SRAM initdata base to
distinguish between different version of ACPM firmware implementations.
Sadly I was told that specs doesn't provide any version info.
Or probe for implemented calls but that may break ACPM firmware
potentially.

You also mentioned that there are capabilities returned by TMU init
call. Maybe that one can be used somehow.

Thanks,
Alexey

