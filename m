Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324123D1AA4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784843276; cv=none; b=ckNtVLMF+ht1MF8e1YDpaWb72tjKtwYHY+Bz4FBf5jlQLVlhdUSD0LZ6r+5hVjaWxPjwjzdHVrIkaibmtN/BnCca302d/+mNGvXE8U12d6txtjMISntytbFxbTSFcsw4BCOwXk4NJwHU0M1Bxrq5lLeZ5sGxoOuAbFGNUx0h5a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784843276; c=relaxed/simple;
	bh=iV0DB1IMnoBJFnSPG+BJBYj6LaiitsOcMqjwyNRMcSA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rypmBDKqGg2e8njMFnE73BPt6wRU4wwO7v6JXO8T16hWXr9oV76Fun3+ScBxFtvyvUGjSovjTVYOA5hbenlxt8836icyTprtg88atsok43u+J1tmBOa5fpO5kfmWr26eG3e0sKC+Ik3tnhYvlylKZ+T7W9HDwvqXwvNHXKITmNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0C8C6bU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0C8C6bU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so11904925e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 14:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784843273; x=1785448073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MVBWHG8ESuMad3qr42QTUda7Z4q11ujZE8cB+I2e/yU=;
        b=d0C8C6bUTNh/9oG6a1caj1XPTXLttCiqI7KhBzk8XQKS3iwV1Tb8IF2Vk+TZC8xV2S
         acSnI8QWNHa7sOT8GMkXpNGLcRevcH5KRm3g/GXDBYGn8ZHQXs3f8tWWnYoHJiSadOSJ
         UAODMeIL2zKCqAg8oNFrkgikW7Lc4O7vezmkGRmiFwg5j3QjbU9AdGJMQeVaxLnZr0qn
         EHnWHbfbMMfOONovUYZT8q9qtkUOqLZ4IYbzbxRait5sSg2zET0QjkYm6Rpu+312cRxK
         E5yFwLgYx/D44RGGyHerUONIdzxZMuM22JKE6EnpF4ZYUd/Q3e64n/xpM5Lt1+APVgS0
         SAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784843273; x=1785448073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVBWHG8ESuMad3qr42QTUda7Z4q11ujZE8cB+I2e/yU=;
        b=KrzDEd45TwjLrpYq8JmUmPPpZBQgmVZ429z5GZVGhnb4xnRV0W7Hx+H7joPnpJE96A
         KIIxHOiONYLh03TtMZ3HNsKrD2ignTH1sSF8Tq+lphbGey1G43NO/8tsUas8cwZSO2Cd
         0R+dtD4lCsDSxQg0zJILLIbca37atd6WM6xJJevilDNnKg1C6KpswuNYGhxkEJEDCc95
         B4afM/g5W/ba+DTOs/qGeHzkAlIlJ9bwpacAZbGLX7gRWMGOlpGJY/UfFP9oSQQDIbKG
         x1B7CWXRkbjeVLsRsnFZPBeScn0ZPq8dsET0sQwLRxRZGyc9Bk7JFp3e7zNfhSeuXm6S
         gzQA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3GbU1aKWXsS5imnheFQFz+T/K++NcV38HE3lUmT+kur9zqO4toB37W9rqiy7Q8nX7qnzZT5xx2zYBqp4+Bt15nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYyfQ5Z+U9VHMrevO/KFN1fALepmmuXeWRjA6z2NJcZlkMzs0J
	Q+GHaCmYu6kiRZM9gCLruotTf1EENkcrtGfnFbJF01DtHforkAfrBUvt
X-Gm-Gg: AR+sD10gwQ9ahcNoEwxWFxroE/Z/kPKiqsl+Rm4fYlghoGAcEQSF4qaa0ohRczG/bY+
	RANHaYfFFYvTFSMCScqUp3PpIVMl1z1HtNUxgCvdHhuc2r/ny/Mo83IcxbB5mXBeTTsmG3yEfwb
	eXS/2S4baQvWgBValHZi64mHC1VUk8dNRUMqUks9kVI7DTl3AELL+9y1Bn47OajpkyvqQPh80c0
	7OoD6akkZoyodmCK19NiS4GybFlm5VMBNw+GKq/gsfIp4u1pcHhsqxTCU9xd65ISbWaPrq5V1+W
	hLTmp0PeKntcac0Ir89zMTYFCibQXwkJyz/dup7rBO6SVJqUomo9O6IHvOdK2a81JQaPl07WcnT
	oH8DPNroJSOH3g0ccrqGwcbm0ccCYF9k1S/D9Hvgb79maeYzq9JegPgURUzVp0JeEXWcC6dpsGx
	I+Acp5rlFHZ4Zs5fZeaxhZgP9LM+P/NMBJos2QmvmDitbl8rITwzCOiOPpaBy7jbobWjH4QwPds
	CckQL6GpqU/N7GEVIcW281Pniv4gz+XlE7t35+aQ8XGzY3ti4Q3xjSWxtYedqmap21OazcC9uzC
	KjDMa0R43ozClBQ3CTh8CDQuWYaprynP/LgL2JhvnYLppKORIkci6OfynHwMymULAWO+AVOBMEQ
	D8UfQzGr9eq8=
X-Received: by 2002:a7b:cd14:0:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-49573cbfb7fmr37428135e9.2.1784843273372;
        Thu, 23 Jul 2026 14:47:53 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bd9bbc4sm13559335e9.3.2026.07.23.14.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:47:53 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:47:51 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: proximity: add Sharp GP2AP070S
 proximity sensor
Message-ID: <20260723234751.5ff138bd@systembl0wer>
In-Reply-To: <20260723-gp2ap070s-v1-1-b8ca3a4c10dd@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
	<20260723-gp2ap070s-v1-1-b8ca3a4c10dd@disroot.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jul 2026 22:58:33 +0530
Kaustabh Chakraborty <kauschluss@disroot.org> wrote:

> The GP2AP070S is a proximity sensor designed and manufactured by Sharp
> Corporation. Unlike the other GP2AP* schemas, this is strictly a
> proximity sensor and NOT an ambient light sensor.
> 
> For power supplies, it expects two voltage supplies, one for core and
> other for driving the infrared LED which is used to measure proximity
> distance.
> 
> This chip has been used in production mobile devices such as the Samsung
> Galaxy J6.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---

...

> +  vdd-supply:
> +    description: Voltage supply for the internal circuitry
> +
> +  vled-supply:
> +    description: Voltage supply for the IR LED
> +
> +  proximity-near-level: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

vdd-supply and vled-supply are definitely required.

-- 
Kind regards,
Joshua Crofts
