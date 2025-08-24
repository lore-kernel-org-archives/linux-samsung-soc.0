Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FBA231842
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Aug 2025 19:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756062443; cv=none; b=YpPNpKvEJ4ub39EcynbWV5KDNPsx4HWOBmMvZnLF0VdJZROs0iuPqsEauHveroPzOKNDK17zcBVjWqYTiIsmc5CQE+EyaZH8YSUBxPd5e1YvHPHDofk9Ubd12TOmAd5cdLAG9rk54rDV08UNgImBrgm//OvLFALrkcfMjI4EzRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756062443; c=relaxed/simple;
	bh=Or9relOdtZKZQi+PZvyFmONuNwHiY1OaMP7l/cQpXAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1DVllueAwkyOpcj4FoG8md6wiOzkBX1DoiBZfXdzVgYZQfLbpNSfxrMsokoeYJJZwCRFnKcJaZxL18jYretF6xydlXw49E4faK1T6woj6UABtJAeaBVu6vFtveVWCvdr/a6HmkyW/OvWRzUiWQzRfV4PZHuemzRgu4y1fBlgpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TP9v4FKl; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TP9v4FKl"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55e00f938dfso539310e87.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Aug 2025 12:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756062439; x=1756667239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRFerQraihZIanmomm0IKhmbjfbkS3W8YtjfgYvp2fw=;
        b=TP9v4FKluJ7PjmXmnDBpJalFojQEpojrdUcweMmE5jAjk3kpFGiwY3I/etMGHHC10n
         0sUd+ic2YEfRyaE09CZoiBgS7Lmf9FsZ9sViLLUvmPVEGJcuqtLxtPopH84vhHnxem9m
         5TGZD6cueZvMsB0i17kaGjhOly3+ymGiA+X3wADOK8YVdTCpE+QVrmBnRelYHAntuXlM
         9G7OI8rElJLTtkUDd7s6Mnff5D+RBx3gNtcRGdbJIStzUVu9eWjjgWfUycZUF6TSrWD2
         xF6z0PbnH254SfN6+SGFaqxGcMblbw8FvF+eBcNAE8SUYWiGSE4fZR4WfIUHnM9BPQTi
         Z3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756062439; x=1756667239;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRFerQraihZIanmomm0IKhmbjfbkS3W8YtjfgYvp2fw=;
        b=kTNgfky6LXlVeH0lVGrSK7eWaF5lluyl2R6vVbN3tiCzKFOUzg1VPw9lYXQhn4fBOb
         oYHyOLZqYfNnUkEDqReFhiQl68z8ZjBxL+5pLsV+CuCn5avaRegYIsbkvddA4y7+XkS+
         sXRAxNECij9XiRWgE419RdVk8ll1RSdZE0P4tPC0j13KbZxqyR95tX6RLkbFURi69oSc
         3UPxgO6TAQViS94qvC+jsBUlDElKctfX4hnEi4LLf1WGxDbIc2IaXOoQARuaTwJORSP3
         RE6hcuXsDJMXy9orvcYKtKk2RhZwVvA+EzICJycio4StGKDbhQeApIikHqRskqlNWRXB
         kYuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgLsDRmIxA7lt1bSt8+i74UwTpQF8rk6fiG1aeCmf91uffPvMFK5Sy5q1Bj5njOTNpQsAMumXIk8IffUHhK+T16w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVubP+lQxETNCAEoETeaXjt4a0Xf9ubzJQeVXqRz0e4LO4E3Ik
	cWmMCfAU0BXnXUaQ7K2y2qPq3QhSnl9wm+ecVDLo+DfXy6jnMLEYqQohmJP+oYr0vmY=
X-Gm-Gg: ASbGncuDiJiFZnZPhXUbJXyRg1kqGhK70Mz+ltQPigFHFq7wZJ+WO+v1LLZi+8JU1xk
	R01p/HsimoRMn3K4eX9JLNiN7FW+3TjXeAcMpCCbDThEg/i0j+2Vp2LYa3R8OLI9pF7HhaoPbHs
	Nli3bAI9GEJy2M+6ofUEnS0Pjsg609XKZDat6rZQ6p/J05Y2ysguZOQnsyc1BfNm4fzjJS/i7Bd
	f6nUNnoPBp9h+kllyLXRDNGS4VI8+uwl+hZMTFyh0t3J65d+r+4xmXhUqrxsfLzFPum1DDT07Uz
	1/U4THMpFvNxTnkR2g2SFGGn6M/z18LgYk9eEl24A0BKSO9RTUW2vBE+AEFlRUIZkjLD97sYWM3
	qyXTYsuz2i9N5a2QahhWxZVmbKE9doWSZltoMfhAthz47J+TY1wo/l/iQF++D3krGo8vQmbf5UT
	FSgtfl4CexWb8=
X-Google-Smtp-Source: AGHT+IH13MoxmrDQetMznYo3yow5OENe/3UHzqm8TZjVRtSQjRA+4ERWWZasIRoFRuhqFpxTrCVdqA==
X-Received: by 2002:a05:6512:2391:b0:55f:44eb:ea92 with SMTP id 2adb3069b0e04-55f44ebec0cmr134730e87.7.1756062439301;
        Sun, 24 Aug 2025 12:07:19 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35ca6713sm1206429e87.136.2025.08.24.12.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 12:07:18 -0700 (PDT)
Message-ID: <b4221eca-7977-47b3-a563-f392d7dafb8b@linaro.org>
Date: Sun, 24 Aug 2025 22:07:16 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/65] media: camss: Remove custom .release fop()
Content-Language: ru-RU
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
 Nas Chung <nas.chung@chipsnmedia.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
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
 <mripard@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Corentin Labbe <clabbe@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>,
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
 <20250802-media-private-data-v1-20-eb140ddd6a9d@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250802-media-private-data-v1-20-eb140ddd6a9d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo,

thank you for the change!

On 8/2/25 12:22, Jacopo Mondi wrote:
> The 'file->private_data' pointer is reset in the vb2_fop_release()
> call path. For this reason a custom handler for the .release
> file operation is not needed and the driver can use
> vb2_fop_release() directly.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
