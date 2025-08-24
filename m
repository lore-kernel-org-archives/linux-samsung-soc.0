Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226F21C19E
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Aug 2025 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756062293; cv=none; b=SeSv28dP/r+kJ0917+cUU5F/XmqBG+38PY97YIlGaB0AGByviQwDzcfZj0IKAJr0QFCbyq3J5SpB18QAAV/TtIu1eNegg7QS74NniCl3/M2/UPRIOD6hs3pCn0mUxMwY5bHx1OfqwcMbI4Y3n1m/TcBj6ostv6IhvKEAD4pg5EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756062293; c=relaxed/simple;
	bh=UP+AYol+DY8UTEmT5RaSgfZsggShtTb7514fxVj9jCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cy12Y/rar2A76nOJhrTYJamJlqfXrX10kPXPVILNvNwG4FmLpqnA02eRNyA+IVQgRgtkgB43HnuYjbWE87Ycb2onswvPcBwsBOWWFOQ3KnnwlfDRo+88GGwPzgQX222iOMeApbsycpwqD4b97IOhBiUud8M9XdoPPQkPVPWhPxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xt+BweIj; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xt+BweIj"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f3bb787a1so80162e87.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Aug 2025 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756062288; x=1756667088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yqEEUlIDSc/+3KFB8fDmfBaOKciQCNwulQzIyyj/3k=;
        b=xt+BweIjZ9gyWWKUxS3RYMaB9pwRpO0pNpbeP7xasGsGNN3QfOMFeqP+AWSUB7CXi4
         K97dymZmnzLNS1iLlmg2YltHWBEmCqaIgLBcKAgsh0Tnj3B5vmBdu0id3heOFTxKnvUu
         PB6FHw5Z5s/TkvosfV4u/Ycpdtmyv6KQMOcV1tY13CT8jAY0yNG4Cp/3UTL3nuQ/+fha
         CM2VayOWDYdmBasVIGxZNqKn+fvgHGMM5g/J1Xi/0GUVuRl8jtYo1bWQkUfBEFExf52I
         u5CWucaLQcCI8kIZxu4dbrGLuhmzF+SFQ51k2VfN2GP0XFPZQ+PC7gE0CsvN4k1twteR
         90Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756062288; x=1756667088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6yqEEUlIDSc/+3KFB8fDmfBaOKciQCNwulQzIyyj/3k=;
        b=P1x2NZ6z7i2lfYa8tX12TvDjpXmjdSb5gtgK4aFOvRlOhJwqhxefqZb6h6WUMS7dWG
         GihjHTFYmC1d0gXKJ8B7tCDQ7pu2tUgk4Ibxz+FC7/MEsKhkGyllmGfDFVfRnMHyMLfy
         X2lVcALDLQ19b01fs65s32xabL/vyBhw2UxN34J0fwD2vWaeNMFF4gf6eQ/d2cGewyqp
         8maFl7WPLei4TMLK6ngw+2CZ/9Lv6HRF7pyIJtlSoZdUKsAcl8iDXIxOjomDt8rZ4i1w
         6G6n2FQ4JGAIo1OZ9vV5kvCcVdJzrssqIB+DFnxQQt0V6Ru9XNLdLoZg4ImXq/htYEuJ
         ewzA==
X-Forwarded-Encrypted: i=1; AJvYcCWT0XA/J31B4YSG/aNxD3RZFCKhKlgnIKvJRNzlduzGZozmGoF4QHy1r+0AlHH/79Kez4O+2pEdDWJHofW3QDRZ5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/y2UF/hD2a+EaWND9VvcGdj9l3geZLInCmZ4/3WSKFoh7Oh27
	3QSZqJVzz1NM7BYH6G/zTHsVpTlry6JNK9WWmGR1iJCiBUk70klUEyti0vyKvjtd204=
X-Gm-Gg: ASbGnctgTm83yzje8vGQDkfZGMEw+yMKF/vwO0JehwmlMpDIJa+rZHJ2p9u8heYT6+g
	IDSDQ/072fF7T6VoIG/0ko+eQsiqJkcSD9QpNmKg5MZV0QqGAsheExpuIgPagyIkg5SvP5nfP5r
	p7/MyD7F/x3FT7Pmub8/Xhdof4MaqVhI9ZN7sHIxKeCmqMpdYC2McKGhGo1RsuMfb6wCcBC9wrn
	ELPEJDAkKyTDSAtIlM6vUYHaY5HAtoTVvaVKyGMz2InGjBz6APQ/VkF5GjU2lB5BDvpRYW0fPYP
	AiJcJ1d2UkygnWOje8rk5rMhEhW6VMMv7xiuOomX9IvTJrBJCw8Ynw44yBG+cA0+SQra1Y51ree
	e4jO081YH/SJobp8sYpJNDnuqDhyxijvgMw6BOg3dSNIuOlMw5520LUi1t3rw03QAY5GiL59+Ku
	gz
X-Google-Smtp-Source: AGHT+IFyrm2w79r4qu/FnmHu4qBJdoxQ8tpCUb7HA7mtPlKxjeyzi9xJQ9J7AuBmZ4uek0zzq2ON9Q==
X-Received: by 2002:a05:6512:a85:b0:553:24b4:6492 with SMTP id 2adb3069b0e04-55f0cd6ef0bmr1246189e87.5.1756062288277;
        Sun, 24 Aug 2025 12:04:48 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8bb4esm1204996e87.75.2025.08.24.12.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 12:04:47 -0700 (PDT)
Message-ID: <fb733991-857c-4a5b-ba20-d8bd557a4339@linaro.org>
Date: Sun, 24 Aug 2025 22:04:45 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/65] media: camss: Replace .open() file operation with
 v4l2_fh_open()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Devarsh Thakkar
 <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andy Walls <awalls@md.metrocast.net>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Xavier Roumegue
 <xavier.roumegue@oss.nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Jacob Chen <jacob-chen@iotwrt.com>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-19-eb140ddd6a9d@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250802-media-private-data-v1-19-eb140ddd6a9d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo, Laurent,

thank you for the nice clean-up.

On 8/2/25 12:22, Jacopo Mondi wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> The custom video_open() function in the camss driver open-codes the
> v4l2_fh_open() helper, with an additional mutex that protects the whole
> function. Given that the function does not modify any data guarded by
> the lock, there's no need for using the mutex and the function can be
> replaced by v4l2_fh_open().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
