Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4103C488D8F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2026 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331668; cv=pass; b=Mm0MIEkGqKwgvcxSuv7fmP3Y/H0iRYziCue/FvOOpSA8zkKXCGITwD5ZGxD4h8mZmweIg6nuX2EXN8D+slsOCK8MB7dgfDnAdppFai6m+CqvLI7+0wSlcXU4F6aQ260b37AKHLCSVC2pf86ReLduNkN1ajHyuvjkLnqtsfFWxqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331668; c=relaxed/simple;
	bh=OgOjW53rnAfiOwa0Z91cSeL+u1QOpFb8UUqaKb6EK9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fIWdLeCfQa/9+VL180TRP7R7hfRf4/b/u+jCELwaNnycMHV5mRYcpRegy6VXT8g/sPsNfm06v9NPpeBG5MeGffsaXJVYIhxWABe14HIrO6QpCjRyEkKVbuEcTBxzqFzTKpWJHlgVFHvRgrUwk3zNZUsjHlWYcMIFFIGdiVXm8yQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBq3qWiM; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBq3qWiM"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6ab06473488so386341eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2026 06:27:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785331666; cv=none;
        d=google.com; s=arc-20260327;
        b=CRUI7AstHu4ZX4xAeqHW3X2LxEIc8tUGFrlsL7OaJJCNmeT8tnfjQnzecUX6aqyA8s
         2K4ZHTkE9ApV1fVMturBLn5GJz/sUDPfcxl+qN9ah+qrk0ZGrwIZT+pGyjvG+NnQbnr9
         s9nH+SR+0/HtwHHrTQhYthqwQ/79wcq3geuYaczHcN4dISTAfkKjbTKKt9YN6r/TiTaF
         3r9YZCk3EZqN41vCgGAAWAPFMsqcu+anCpxW+9pztIUhqTewU7qPX4Ex3Sgh+S+SCLUA
         8clwYU3H59Xc6WBf3e7SP28I6kJ7WRLYSqOui4tnh1SdUHoUHiO1MK1wXDP/O+P3y37f
         3Ojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gxRULUArcLi/mAA3UKCNpTlA+ujH40s8IdE4tkoamgM=;
        fh=awcrnBxAjZ89nKe1OIDrnr0AktLbueaJz8B36Co+1Zo=;
        b=bWAfb3BkszeOxOWJB3DPwGvcgbLiNTJC4yfdszhqkcIy/UQSx8BHbWGI9TvKuVIH0X
         XO2TDJNnlT+VjHy2alTNXiXoJQR4fKOUQnOxRm14plE5bu7L0SZbpaDm3dQ7Y1DUSCmk
         jlF+RJyB7NQLUrWGPoH4tzuHcuWYuiUyBmSto8iXkkdbQrt1n55S9e30aBhm43ELGdMH
         eDv2sOrEzvQIM6dJlJ9AAmQ/jPRyrMpTeLJbaBVzNguNvPDQSBZ+saOWPoTIMmMO3kXH
         BaXFbubnr0WSuBG3F/yTzfnI11ws0enstth9AE684s1NDBlFgrY6cPmPNJ8LXZ0K6jh/
         Y/xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785331666; x=1785936466; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxRULUArcLi/mAA3UKCNpTlA+ujH40s8IdE4tkoamgM=;
        b=VBq3qWiMMzzyALl8omvN3uc5vwVRzI/mmztioDa9PntzpjCFCRYTfhnu0CfNb0ZET0
         jDqaAcg9ptBAJxeJHt7BmAzOLRZxRLb8C0PROMTEx6FjQSPbeeBM1NMfZI5Yf9vQlX5E
         98YkDbKqltG/iwD6bFdPmyuoTuxftzMVszGa+RqkpyjCO9Jhf0NMPaA1AYW7CIKRdeXG
         RUVyV9MJNo4Z0119+Lm1ha/cMG8I9VAJKpw64lSQU9sAnWJ+EvYFv/jIXhm6+O3FVTh6
         ZMFf/VU3LFzHMP5k1LlZVmf6Fw9RruZQVr2NvYqTSx7W0jUBDpr6iETCdKVI/z5vptrg
         lA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331666; x=1785936466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gxRULUArcLi/mAA3UKCNpTlA+ujH40s8IdE4tkoamgM=;
        b=K1L7fYcL1/n4VWS/NvnjWyAhWXD5d0yI3SpLn0ezcyCKllcpKV8uuXTT5wMIETmnU+
         e36BPIA9JExVnltQdUbpuMI8fWZrHDZm4kDML9CBDK5D9XImT2mNl9nFAQK+ItAkB8Je
         Llsexot7pIJ2EQjWrYasoj8a81wEC6wweL5yuEA8kg1nP0hxV0tSKwxcB2Q1O/AxfzFL
         I1eM/hq9kNBVDthT38gJaKUYyR88LilgF9elzYQhRxO6lvKkyoey3mdiCOaE1IYNkxI3
         X9ePp0rywjqO3LFDw7xcLMcLq5qL2CR5A7d6oK8ApsR5Fc88n1F94d9QVfADOMrSiD4X
         JK3A==
X-Forwarded-Encrypted: i=1; AHgh+RruO5O7gKPMR0awIPwv1ZcK5NVd5Rq+s8KNbJ1ZK5fGw2/pPAkwPTxd62zZzV/hUm4i9KNftz3PX2QcspHxdak8JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWMG0jH8ytUitsGdMUPhm1xFUBI748HV0KG9PM79zKAinhqgYV
	OwmVsMGm8ITevF7nMbOATBq51qpHoM8ZQvSVdrTUMCAv8fuHalh516XtA9XbOm2otqair6MdM8a
	ZmeVGwEQLcURWrHs2pa/ghEtzUvjIYvc=
X-Gm-Gg: AR+sD10FcZLZ10az1asVTQi8ujHuJqgOxCAuvsKkxgxsOYrPAZvi6dfU5lfDk0NJckn
	yNvNjk/VLIkJpwsoqfmZpuDmv6GCCjZFbXZk0wFHIZRtyFmXTpIplfAvAeSkHKNc53dXJqpIM/B
	0nyS18RBlQzmiWT/0IBFF+s8y77E2VpcBlZLjXRqKXNyDK23HZhikMQJSIND98z8ADauQZJZ0UD
	iBQUdws9Z0r6697CuCe1OWGdzebOFwvKv6d6Wia3JtSiC8jcgwYIQ+ZKgaTNq3zSgPgVmRgpDFQ
	+5npu5I7NUad41aLrz/fB9OHBxhtzGwnhfwVLneq2WMKntJ8MF2dslUv3g==
X-Received: by 2002:a05:6820:2215:b0:6aa:ea7e:1dac with SMTP id
 006d021491bc7-6ac96bdc308mr3238719eaf.33.1785331665974; Wed, 29 Jul 2026
 06:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org> <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
 <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com>
In-Reply-To: <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 29 Jul 2026 08:27:34 -0500
X-Gm-Features: AUfX_myssxkk2aJ3MvoN2H0D6ZI76cn0SYIfqLF68G-ApdrPJCyOOHfepLXThTc
Message-ID: <CABb+yY05L30Gt9cmF8Hoz2sGwUc1XocZG3vPoKMwEDfRH4tpKg@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
  Replying in one place to the two main points of contention ...

1) Compatible string :-
   I too think leaving it too generic is a bit bold ... we often think
it is final but more often it turns out to not be so. But I also don't
particularly like the idea of naming it after the SoC because
controller IPs are usually not tied to a SoC. So giving it a
controller version specific name should be good. I hope we treat all
controllers as potentially 3rd reusable blocks rather than a part of
SoC's identity.

2) Single-channel Controllers vs Multi-channel Controller :-
  Looking at the description of h/w, especially the separate and
optional register sets and the fact that we are not talking runtime
ad-hoc links between two endpoints, I lean towards single-channel
controllers implementation. That seems like tidier dts+code.

Regards,
Jassi
