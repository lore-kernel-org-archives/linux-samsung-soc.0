Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2631DED7B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 01:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317307; cv=none; b=XcKI30ck/j1hyU2HrhA5dYhDLgDmpjYZ9k2/vMP4bhRC50cHVxJu/uCuq4Pyfc3aVTfgc7jQPQ4sK41oc0X3oTEWfD+AmYGdKeR214gFgXuotoRU6gfRAdFnEDGF5putRMnU4Tk9bK9sH2Yn1u1SCzq8MwJnLXHMEYqZRZL4zmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317307; c=relaxed/simple;
	bh=Q0pn8oeo+EcdQqzzyFQGfHXmr2LXraohVV8PKC0lDGU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q8mVZNftLhP6pAoB+S59HtPEl1HotJ/cbO+jKBgDDAX9iFcQq1RGPN9x/fQYXpdIgPJRupKMxkgDmZdG1yOJH1C/9/UG86ElDAeScScTld+qgFgczBkJlGp63JyK12a1z5DRmiYHV8AscIquMSFhOQZfCLgfHuZKfCTT7dC9ID8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=byjPXSG5; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="byjPXSG5"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b47174b335bso221594a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 18:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317304; x=1760922104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPXC6v/EI3bevjgCYFAPjzae6a+9JFnCELYN3lWtwW8=;
        b=byjPXSG5DmeyBXjGLF9BmBwYji18r8Y1BYQsWCY0sTULTGJbpnfsH1rXH30Wp8nARs
         AHrhVk9XZI+bYGIIJzaao3fljaYo8P19baeQVbkRGsfORD1evZNr4x/ssvjnEe0yT0Ig
         DC+1oDU5HWfmxJX62cQhJeq+4l+tpCRq/u7CF2HU3X1y0Y1vTIZcKUKmqAbX2MVxSyZn
         XO71bngpNP6ha9GcbJpzPZCou9rVklghvg7uFYbKQYTkuPsoe33CocP/QHBzISamkHNV
         sYAwQDMM13nO4WWT/0vWpneUnJ24yjtQM3+qYwXNbs8a1E/Un5WupzlyG1gY2uMHy141
         FPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317304; x=1760922104;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPXC6v/EI3bevjgCYFAPjzae6a+9JFnCELYN3lWtwW8=;
        b=v1ZnLK1PkunfH7wDQhY+zEeqHCNSjjz8ZuO3K7+rqhqVfLP/SzJQ4t+FN9bE81cVvL
         NCaqhSFREkKaa6qTjG0Of1saSBbdf1D8hpImECaUP7mJ/ah0XO5i0FPWLi0wyKhGX1BH
         UT7DG7mAYIp/CaWtH7v9Kx2a/SRCoNncEwhv4DOyq+8Pk01vPC9fT4GpfjoV6GlYubPo
         WZsUWsbadlux94yb4x6bYK+OlQgQ/M9alJDWnHl6xTVER8MsDQ315ES70NpnPrmRgonR
         QrT4kUuEXXJGkPOzYYhypxrSCSk9yKdYw1mtGw29tBOkh9BH1W3DPixHeJIuaHo3yHnu
         h0Rg==
X-Gm-Message-State: AOJu0YwgOe8V40TPucfSgknbGE/JBiZeL/VLevECmNr890XZBPF3A5Xm
	wPgKLgJm6FvEYRiTehdpUHMw9ei2Uhov8lCAg11Ju3vrRMD0pDoTPaUk2/qerc0qAFw=
X-Gm-Gg: ASbGnct/mJPANp15eXn2OfUSnT60nHMaZmCwiAQyHdFd8V95uBUjsx48IbP5qiCevqA
	xC3pq7Dq9ySLGpoDRfNkKSa9/gkqq1MYAO+rC4Nfa3OCWmi9BO14mTbyWAokjsOhag4rWfz0ENZ
	k+Ss/6wkLQZjX9L0AlE5Ob4QlipUTpm4cIITcGBfo93tr2rF980ECQO705XyC8xNVLlw+er6NIY
	tQfQjeIRfEO4pc2Fgg0MQZ2FXtYw/2tZDxDOzPp71d0oFnHOvI4+rWgBfrsnJn2Ia+nBn66azyL
	1LotS8jjGTdUwiUyM0fxSxKhwNbwls/xq8ZjeEb1pIpT4wroyJe8JLIPnmq/w3g7TiaRGgMsRtF
	S8LEBWt1xnG26DwZg8KqrP35NkWBXgdhzehL7DlVinFlhEQK8dU46VgX+u2jX
X-Google-Smtp-Source: AGHT+IHGK6ykX0spOQKYWsRpuS2oCY34wte5d1qjAZUxv5DNXPyTnvUCU5Jclrwq6RaUGeZTRY3rkQ==
X-Received: by 2002:a05:6a00:cd1:b0:776:165d:e0df with SMTP id d2e1a72fcca58-793827947fdmr11943201b3a.0.1760317303940;
        Sun, 12 Oct 2025 18:01:43 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250915095401.3699849-3-raghav.s@samsung.com>
References: <20250915095401.3699849-1-raghav.s@samsung.com>
 <CGME20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89@epcas5p3.samsung.com>
 <20250915095401.3699849-3-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH v2 2/3] clk: samsung: exynosautov920: add
 clock support
Message-Id: <176031729821.32330.18319569352723802430.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:38 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 15 Sep 2025 15:24:00 +0530, Raghav Sharma wrote:
> Add support for CMU_M2M which provides clocks to M2M block, and
> register the required compatible and cmu_info for the same.
> 
> 

Applied, thanks!

[2/3] clk: samsung: exynosautov920: add clock support
      https://git.kernel.org/krzk/linux/c/ac5d829873c737edae220ee654e423d383163630

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

