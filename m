Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BDB3644BE
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 19:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764961920; cv=none; b=GjHjYf4s+RRoI08Wt4CpddWnwdnTWMw8atxC8z2EOfzeYsGLtquBtyfnaG0g/ASLqi3dmEPZtPt/Oq4gM2QRGHNEMT6d9ueCLjYCSOy98uo/+sEQZpOYVhIiZQCxj64Zj7rmhudwqsk1WpeB57Sg9ZWXjTx7Xilk3F5+CfyZrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764961920; c=relaxed/simple;
	bh=wM9ZHbZ5gPCyVTZL6N8CtsU8BUTDcZjFM6EaKvjgNpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVK++qCVLnsaj1G1E6QFBo9J3qrQb0VRs8kqWn4cwsmBVxgZLH67uGpv18bD5REGgN0oWeOt8M5bkFz0tOg6ge41unR9DKD7HcWWOjg5nxjERGZ7a8LBeNzNxTj/UsrNIi3lmo2fZE5+fvqLZkZ73Tt8lw+Tc+eNfjjKYA0z4Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kqU8J9VU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kqU8J9VU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-298456bb53aso33150295ad.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Dec 2025 11:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764961918; x=1765566718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wM9ZHbZ5gPCyVTZL6N8CtsU8BUTDcZjFM6EaKvjgNpw=;
        b=kqU8J9VUgJ2bowjYCEe5HZaNp1AR4mNvZlFDNJWNZG5k56OTBNr15wPy5SHIY74Zwn
         EpYhWH2KDNEiVsY8NzDqtLC3gsciGlZNH+PVKHFc/K+GCnoRL8QdGLWNAl5hBNbUwL2m
         R6UMAG0hCPUx8bbc9VeueMcjf69Zuq9tDx8KCt7sFYp/aXVX9BRgj9jjgmJLOLXzDeX6
         lSJpHTOpTQuXTj238Gf/vz9rYpYUc8Uj2JCF+SsmvdbXbT8CcOcCFqyI161iURl/2KNL
         P1SsdkW19BOF4n4mkFUWAjoK9P/Qxd9V6oqX8FcnR3y5FHSSrFDhMDgT83oU0QcOAtnn
         HoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764961918; x=1765566718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wM9ZHbZ5gPCyVTZL6N8CtsU8BUTDcZjFM6EaKvjgNpw=;
        b=YFNHia+5TgzOvza9xjb9bNmOrQohgPWHwFd4pNW6gdt9cfx5ehiSMp9qgHTJN2Ibx0
         2bxl+YjDhd7Xzg+xa1RFTl8ZP4VqZdIGb+0fVe+2RUiXAHpEzY5CntxNpwVAeXoykiuY
         oFUS4tLQTV1nbrKSfhu6PiXgpCwn9TzeqXvaW7Ol5XKfGG2lqtHz14a+q9K0ou1iXwhG
         VFvqDdQbCideyKDJRAu/mE3QicCrrULqL2/kvhshwTBYKwpzMVmV04HGYq1mxmqXN6QN
         AaXEQWFXDoZMOVViD7X6jirPZXT9g2kYsDqLc0L2HeNJjqt0glzbLXaVgjWbNK+QTAEK
         SpYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG3G82oSS5DVdvvucwpdXSzBiGP6D4vxAQvW8GuRSlAd9TJKmllkGaGuBeRdUFgKnk/Z3Q7kilDhBLrJtlVf8XHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3cgmpb9fbmGSE6sZaMZnCfxOoKPn6Q3DcsQ+qrtgkoHPc6gVL
	hXf16z+TWhXK4gdOmaB7CwO0cMRxuwjfUUBvec2C1caOHJ77aNtXjQT9tCPa8VqB4X0KA9ck4jH
	4v9Rc459MFeZkkwrJj/PHA/+R7fQEdzu97q8zslEn
X-Gm-Gg: ASbGncvxRXva3ce/pa9rAuvAws3++r7xvx36cApDDgeHlYklEXfwNJHvdI8AJcIyjb9
	Mz4/xEUYqn9N7yL1bow8pZFZu4ZNuIrrx/XRfl/HrTaTexLoSOyMS7o10quu9MQfGYahWS7fnnn
	/oTh74hG0j5oEADCago9CHSZbtTU1rnfhjmw5sfKlDnsAgoR7vI4sf2AH4yCliwHhF0daG9WRxH
	BpreL+8nuyiJUFic/gyp04Cgy17XqamVI7gyCuAjVnnJOQFHnur98d2GSCpXfVvkAzcNggb/LZd
	AQNQ5Aqj4Eh2s7fjSwKfHOFql5w=
X-Google-Smtp-Source: AGHT+IF8J92R4M7+pLwot0D0+DgTjmbE3S+sUzVpC/q61q+B6raArwC6JCX3rpjp0dZrIL5XNz8EpvQLm8BmLoh84nA=
X-Received: by 2002:a05:7022:d93:b0:119:e569:f627 with SMTP id
 a92af1059eb24-11e032b99a8mr103172c88.32.1764961917558; Fri, 05 Dec 2025
 11:11:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com> <20251205-phyb4-v8-1-c59ea80a4458@google.com>
 <18eeb1c5-d21b-4505-b6a4-472f6e191864@kernel.org> <CA+zupgwa+m8Pa=+8shORaOA1OO6zoo6zYEojFS2UDuP0doBq7A@mail.gmail.com>
 <f32e0810-56f9-417e-abf6-0cc7b361bd15@kernel.org>
In-Reply-To: <f32e0810-56f9-417e-abf6-0cc7b361bd15@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Fri, 5 Dec 2025 11:11:21 -0800
X-Gm-Features: AWmQ_bm3YiJStmimt8YeHw9S3Ay4OOTCAl_PiUAMxoeOahq1USzcbH6CTsqmBZo
Message-ID: <CA+zupgyxQisYBnLj9_3DtcN3R1Ugfv+-p-wimFp-hnqkhrrgyA@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 10:52=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/12/2025 19:47, Roy Luo wrote:
> > On Fri, Dec 5, 2025 at 9:13=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 05/12/2025 04:54, Roy Luo wrote:
> >>> Document the device tree bindings for the USB PHY interfaces integrat=
ed
> >>> with the DWC3 controller on Google Tensor SoCs, starting with G5
> >>> generation (Laguna). The USB PHY on Tensor G5 includes two integrated
> >>> Synopsys PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort com=
bo
> >>> PHY IP.
> >>>
> >>> Due to a complete architectural overhaul in the Google Tensor G5, the
> >>> existing Samsung/Exynos USB PHY binding for older generations of Goog=
le
> >>> silicons such as gs101 are no longer compatible, necessitating this n=
ew
> >>> device tree binding.
> >>>
> >>> Signed-off-by: Roy Luo <royluo@google.com>
> >>
> >> Why intentionally dropping the tag? How are you handling this patchset=
?
> >> Rewrite every time from scratch?
> >
> > Hi Krzysztof,
> >
> > I dropped the tag because a new file is being modified in this version,
> > Although it's just MAINTAINER file but I thought you might also want
> > to take a look. I wasn't sure if modifying a new file qualifies as
> > "substantial" so I erred on the side of caution. I should've called it
> > out specifically in the change log. Sorry for the inconvenience.
>
> 1. so just squeeze that change into second patch and no need to ask for
> re-review

That's a fair point. I will be more mindful of the review overhead
going forward.

> 2. You did not read my complain fully, look:
>
> >
> > Regards,
> > Roy Luo
> >
> >>
> >> <form letter>
> >> This is a friendly reminder during the review process.
> >>
> >> It looks like you received a tag and forgot to add it.
> >>
> >> If you do not know the process, here is a short explanation:
> >> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versio=
ns
> >> of patchset, under or above your Signed-off-by tag, unless patch chang=
ed
> >> significantly (e.g. new properties added to the DT bindings). Tag is
> >> "received", when provided in a message replied to you on the mailing
> >> list. Tools like b4 can help here. However, there's no need to repost
> >> patches *only* to add the tags. The upstream maintainer will do that f=
or
> >> tags received on the version they apply.
> >>
> >> Please read:
> >> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/proces=
s/submitting-patches.rst#L577
> >>
> >> If a tag was not added on purpose, please state why and what changed.
>
> Where did you address this? You dropped the tag silently.

Why: a new file is being modified.
What changed: MAINTAINER
What's not changed:
Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml

Could you consider re-reviewing this patch?

Thanks,
Roy Luo

>
>
> Best regards,
> Krzysztof
