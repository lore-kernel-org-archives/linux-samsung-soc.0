Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F18133D4E1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Dec 2025 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766588274; cv=none; b=YMGSEKKqVnYonW/sj+4IQ99MHt/LmkxatBGG7YejtUGRUMNSEJkEfrFA7Sz8/F0KkP8MqgM2zC1QKaPWfui5xHxgjl589+WBvnapy5UhqBss+G0zAE7HCg9msfPiGIxmvcOIVGJTBxwmi6Fe2agKY6GbASUkWnjfyGhbhSup2PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766588274; c=relaxed/simple;
	bh=ebqd+eKMCihFKQS/QNA55vpReVIS9sLpQHDnYF4/Njg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BuTQVPAAd/dLPwPYExVt0nEr7v7CgmNOykoxyBPZfZ9ytBizsSUc3L5FKJv6yX0xGgNqsRYrzCySe2kKbIXlGIlovzADdhZxpU4j9Wmc3zq9qf1Kv7rrkyESBer4tq/tjcWNj1MTNxum8i/DBLzaPqEwB78rUMm4mkpU7Y6sea4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FdFmIi58; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FdFmIi58"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-595819064cdso9673228e87.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Dec 2025 06:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766588270; x=1767193070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBil/1BlF+q4Dj/UPxj4gednLToiu7OKX6pIq/V68fU=;
        b=FdFmIi58Ms3hsqEH5wISNl/UkRn2iA2/NXSC5xIS9lRWOHWX0r6m6S+rECY1Ck5JPn
         fJuQ12X+EfyiGcdPR2n1/pIUSeMU7Uylr8KMpfxyynM3YyOrx7UEM9t99UxSOva2Fnw7
         cUF4CRjA9xm8upKP3od62E42p9jjwzu0h51Om5vf+p9hXTdobOEFl4cSp9kB/KhLxSdm
         r/LLd+Ay/RF5GoI+ge77O0NKvggS4T8W852PdAPKb2YsvzbwR1bJ8wzS76d9lvw6GPLW
         lFdwsJPL5wW/EwPV2v26MWaNHv7XNPmcMS6Uzuxu4JVW3K1RnVlEt8CGSsqZCloNP2nt
         ltxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766588270; x=1767193070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IBil/1BlF+q4Dj/UPxj4gednLToiu7OKX6pIq/V68fU=;
        b=H8eyaumH5OANQf2KdL4NXGz1mqjFdryWx2h5K4jln23JM+BN+D2wvrK+G0lRG7VUXa
         4r5QN9alLc2bMe9ut7wWBdmxr6LPoW1CnNAIZPVfDLkgRS+uvCVLq9LeZlafrjSk72Yn
         dRZxWTdqNmi74JNXFOrUhcNSy41jLX/Uo6fda2oPPM2744jRf3wrOgOq1OBfYyPnFRXJ
         slT9mzeSutKNjws3nivpE6RNiDISUbanAJnK5rFoAaTCbPKB9weK/jFj3Hubrzm7I8tR
         ovqrq80R7tx9wgwQV1aJGdBeh+oe3N69CkBFrCMMV2pfx6PzZENmTwejUAptgUP4SSys
         v/oA==
X-Forwarded-Encrypted: i=1; AJvYcCXoE+KAlFf8tHejts8rBGMnDKL4bYkDlpDx9+GZCviuiUZvojCvELFr33cHAFn1hIpjYtPznL43qQl0kKjwo3TjBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkIbp8DHMU/nB0z5UC8Kb7iKJ7QG9M0pFSmJ71jMMofqU+Zo2T
	aHwnB/BrrePP5ofQuIHR5bNhhn3sX9x/5dw8za+bnndvct112osppEwh8DKahPgYcwZZZd0fi92
	zQ8GBYtDa0SiSbJrDW23V0SPtxh23bjYzBmbrmblODw==
X-Gm-Gg: AY/fxX6eZsPTm8mhq4CHLd4z1Tl5uKVAqRORF+fqzjYDWjAI9Io2RPekCcDE6E5giNa
	8QWJCgW9KHk6n1EqfyUGt8AHcHQTOUP/KIORa1xCJE03nW9WwYREVgkeq+tD7fZuWHcOpUHv4iT
	Ns/voKfDYoXNPw+xRMha2Evd+R1WyOe9W4PecdfWud0gf1aFSgmr0z3ZywqOiaB+aXGVgTnOVJf
	wUm8CSiDhC0JhB3ykZlCf7OiZ+v+E6sHP+2/I+bJegv8g3aXFmm/8+9ZqIheGKoBJFm0HFIAqVS
	wfj3gG3B/auBZFnJ0X6K2aGFJEam
X-Google-Smtp-Source: AGHT+IEgJ4DvJza6f8nrVt6smijc7MYv+2jVVc9Xk7eZ3JyUwizr2J95vVnjlu+rq1GIIpvWYrI9MO3mpcNk8k5Vwhg=
X-Received: by 2002:a05:6512:130f:b0:59a:1482:16a8 with SMTP id
 2adb3069b0e04-59a1482170amr6611182e87.24.1766588270392; Wed, 24 Dec 2025
 06:57:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104112923.143408-1-marco.crivellari@suse.com>
In-Reply-To: <20251104112923.143408-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 15:57:38 +0100
X-Gm-Features: AQt7F2p4_5Om9G-3ifUhTGyCvRSOPvuJvIr3ZkpzQW5Po9fMVvAd8RkxxHIjK_8
Message-ID: <CAAofZF4OJi5eEfjhE12RWi6wDU+A9Rghsd2721SxZR4AC08sYg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: replace use of system_wq with system_percpu_wq
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 12:29=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
