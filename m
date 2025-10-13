Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08CD271446
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367052; cv=none; b=IJigALCvanXKps8ek0ZMYTiDQxZ+F3YA3kMp8A6g31hQcl3rXAUyZO8XuvEOYzgXOhtig30d/EcwAoMirvj07u3aQD7mDDkoaiTfUS1n3O2NIv8geP5uuvRxDwQgMIpoIAJPlQSBuMlK6+GbRgjSpI5SEfDtGa50t/bDPheB9M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367052; c=relaxed/simple;
	bh=a8rzeaiQ54tOFcMOe+sIUa8tfmcif5r7xjlXNM2RFaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTgSq9HNkoumsZfSdKPCOCukX09QNP6j48owRvBfya7JBRlDuUhHJRnG1AgPQNSHPKJ4XmJEiz+VIWqINgkO02aEr612NrPpD5fllEb4myqSjXsFb3PGTEFJrWBwwMYi3sRzc2gu6iWlRf1Tnj0DlwjUSOCrmxnf8MHJZCE+qxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-86278558cdeso583019885a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367049; x=1760971849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BF1nvJKgerbunlxq6rI58NsjqwKmmQvTj5E3RRtPIQ=;
        b=NvStr6X8OJtJhPI+jb1daP4WfOBP1cJ6bk6X3TkZmvLuY1U1pC48f7v719MYI45Q1b
         psXs4ipwRYvpZpbHVN3kV4R8Kv88c8RlNXol7UbFpa4E8uAP7kRP1qjWWjNswV2RBvCP
         kKCMFf5mSAL3aeb9ZLaqYR/OFGeVt/YxWCOL2/uzpIiNL+RYEifvTxtBHeH7ktcIIgyk
         G5l+tLd4qf0fvqlAI8oDNbcJnsAiH7rrzd5XWgQPYZMjuDKTd4DL/1ZT1igwna5J/7iy
         61TAIxrSOPaEZK2CxOlr7vt2Wc0FtVxQUo6l+w2/suy1ilC4vX2hqzZrrC8MwdDndOXl
         pQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa4r+D707A5vInIxPKJuxZnxuuZof3gfMe9u77WSjOUgNOZQb6r3sqlUsZlzWWeqAIPYhuN62swHE03iKy3ogaGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW1tooF5hXnj4Zpbrw/veONkVEdup3YfqUKrsWfzzaW71ZCHSz
	PNM5XStnqGSXQg1wp4Ibp3/uw/muDktTLNkLpgCAguUOR0gtVeu/aIUL87XW8GRL
X-Gm-Gg: ASbGncvULlpXgcacECYy79YstqgYSAB87DoHv72EJ7jbBg8M4QvCaLpk7M7Of3FL5z6
	qL/1B4HUCUVRmLnAhyveYtGWCYvyo3zM1/TrfTFAkmqIj5LB76vP+T0DkCwBJT1ewzUhgY0nfHL
	Hq4yoI6HTtA48lWPB0/+3ru/Q9SzRhkg0A90oUo5VVZM8T0G0IiopsZITzuy72uY8obkeQiwQBy
	2kuS7aBzLFIsWv0zR45kzRG+IXmUChpJdwW6676FVmI7W1r6nW1/cwoHDdv3+f7UoTYoOVtRj7m
	r+yz++H28jQgivUM31arrpF6tOu0pNhl4zxB4qrFTy10AykZtLxXVaeFrJZuRwBUlwQdCZ4UvJ+
	m0a6uatdLmKj2KH+KR/eo3QJSRbdNyTLTzOmLn2GN0nvVfF4sNwSBmOgfekOlerxbj9zEqBTH3S
	uZ/juraAWUp/YonFWNdA==
X-Google-Smtp-Source: AGHT+IF3TczYJMd+mEJwXo+mwJSBegl0Qo+lyzrQj7YecvBP7xSkSaItrzvyYQtSsYjDJEOUxw0J+g==
X-Received: by 2002:a05:622a:5a08:b0:4d8:67fb:4185 with SMTP id d75a77b69052e-4e6eacdacf4mr256304121cf.15.1760367049333;
        Mon, 13 Oct 2025 07:50:49 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e706dd113dsm76939291cf.42.2025.10.13.07.50.49
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:50:49 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-855d525cd00so765938785a.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:50:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxmGqkw4LN96/vHoLLE1Ga2OVe7mZTI0FyjrMKp1hTcxb5ipgTnL64lowPBP4C+kErEJ1UeZZ48eVG5VEsSoF/vQ==@vger.kernel.org
X-Received: by 2002:a05:6102:598b:b0:521:57e7:3b19 with SMTP id
 ada2fe7eead31-5d5e23ad946mr7466194137.25.1760366582403; Mon, 13 Oct 2025
 07:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org> <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 16:42:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
X-Gm-Features: AS18NWDbEQGWUFg0r_aGxPQP6vUjubUz4v9cHDpfk8kXxZq-lj2695LEwK7MQ10
Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
Subject: Re: [PATCH 27/32] media: renesas: vsp1: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Oct 2025 at 16:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
>
> This patch fixes this cocci report:
> ./platform/renesas/vsp1/vsp1_drv.c:958:4-11: WARNING: Consider using %pe to print PTR_ERR()
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
