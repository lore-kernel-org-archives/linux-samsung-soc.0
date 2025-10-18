Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF8223D7E0
	for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Oct 2025 16:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760803904; cv=none; b=my3LBJZOs/W+Bn5s9lCGK4RdhKamXulXxs/LTUWhcKUQ+5KeZRCNmIVAiG42cEaKyAddVBg7DwHWfllPX3jW4/3qGh1LO4ycIajGjdrYtdZbcf3xjLNzWRMPnSNWLsZJl01ebPv6OBijcKhxGTJIo4mMDBP9Bpu0KfzUiaASu/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760803904; c=relaxed/simple;
	bh=S5ZFwEPS/R5zgkEYM73LG0yyzWmgt3D08dI72xwUteg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gqZkh7O2SAbi8d7bnuthuw9nuq8vywnl5nLI06ALGJFbxwL9iM2NGTCkq7/N2H73aNO9hZdmFyrVkQaeibsCIvH5n698fKkjNzdpJgaAKWhY2m4Drqxyg0aJ7XyixjhjHYwxRk0GbFVCT1d3dOXx9SQF+u3E6DatTBpKNIuPLpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CAg0xQrd; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CAg0xQrd"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-88eac5a7663so81307785a.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Oct 2025 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760803901; x=1761408701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB1PeMOLXs1r3u9Bm3EJ5/RnLcafi4Uhbd6zm8SAQT4=;
        b=CAg0xQrdKemEWhrVMP1IGX0B0n5R+0W8Lr5u/SL5Vr9S6ItNAG60zqQ8faN/dx6E6s
         Z0U/dES0GX42B4wNpdUX7y/sKIz3ZGPUg2yNFJH+CKP4oUsqfRCsZYCs5MGDwvHrlWkN
         JZJUg2BCNYyx+XOzs71L0ywxiQ1hAPEnwzvUMK9Ezq0yDTAL9bnGZUpdWkGsFyQVp9ty
         EpkM3xA0XGk8lrsLY64qVabnSBnUIPZ93ZEkbEy0s8cHJGoXOp42XGdKa7NmPA2aow2I
         rYNKXuSAm71MSumrKdRm/NwV+gBCSpB10lscAgxxfF1Jpxjp34QZMOxgvp6+PN+5koKV
         xgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760803901; x=1761408701;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gB1PeMOLXs1r3u9Bm3EJ5/RnLcafi4Uhbd6zm8SAQT4=;
        b=a9z6zKPiZRgf9vNKMa7INDKmLy2Z4wmbG58l9LDTiKTqq71qfFhT3HrTIpP+M5p1Io
         EjizSGLi2KU3tba32fzmstLCQBVH2hbsDcrwr/S2DHS40DbuJTvaWb0VEi0Y9fgRDrIx
         EGqjW7lLwBnttJ9259xdOLqXAbNFhn82/1CQwACFemt7ycXCikLVtL2lEdfsvOGsT+Ra
         UFPyFqef7dv09OiBHgpJaAVQvIhpuNV58zPMgALKv/nlILihQ5pf+zGcPuJKOQ2u5IPc
         tjhdTQ1tmcuPdGitmX4Oi8sipk2QL90sdXUfZgtgC7wOUGmcil2zu47W3Al68C8eF/6R
         T5AA==
X-Forwarded-Encrypted: i=1; AJvYcCWdZBoPqR1pG28ljZZ9B5hhuH2tKV1ME1TNGOB0vJ58QQbpkmt0Am7IbriUt5wij1v55BElQ/Yc6wRhPRw3VlUAMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzovd52Mida8+6dWMvRCNPJCE52GA+sDklcJyhakEd/9TVEnIfu
	iB8fMLCznnMp1HViaZcyOACY2wNYBL2x/5dEb3pekFJtJRL9Q8Oc6f1EGUO3v1ebLR0=
X-Gm-Gg: ASbGncuTNG2h1XoA3AAJs2tJIbcwVK/ktl3O3fLXtbGxnOD7YqTdO+YtJlaaKa9w0uN
	Kp/7+/tydNeGZ0RwvBtTuJGRvome58wGzD+1qWH8353ylCujA+I+R1uOVtCXZozMoACj4tMdzJF
	RnxmCnH97RRu4JbY7Jhb5tgMorC8LawYQiPlA5a9kahNcvFpGi9eCYN5LiwoG8vV/AHYYBDb6SB
	UFErgBRQcmg6pM3Era2KhtXUUb9K0jEBTjmdtxAcLuEg42xKxCeeKkMPm/R5oERvlIF0/uSjms6
	XlO/RbxmO7ajr2AYJ1of4O+KmeAULzsBz/9G/CRCUY5c9FDtPHU15sYeJllKcC1RX3b8KCMUDsv
	JEOHQdyec+Y28Gb/ip+ho9Bwj+6YJXOiZoAySiCe5LMuH7ircDf8chKioHBKdS0A7mNpYNs73ml
	QCt//q8K1XEEctijqQIAKFANKp2nnAvpl/mCsfXw==
X-Google-Smtp-Source: AGHT+IGudErotX87fbHUUlOW8PhZW3gWYwQkQZjuqEBocyqBpJK6gFfGLxWRlsagEj71JpNhWFJU5g==
X-Received: by 2002:a05:620a:6:b0:891:c59a:a9c0 with SMTP id af79cd13be357-891c59aac34mr254639885a.5.1760803901491;
        Sat, 18 Oct 2025 09:11:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cefba919sm189319285a.32.2025.10.18.09.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 09:11:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251010-s2mpg10-clk-v1-1-dafb5d179395@linaro.org>
References: <20251010-s2mpg10-clk-v1-1-dafb5d179395@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: gs101-pixel-common: add node for
 s2mpg10 / clock
Message-Id: <176080389770.37784.9004691258148372039.b4-ty@linaro.org>
Date: Sat, 18 Oct 2025 18:11:37 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 16:56:26 +0100, André Draszik wrote:
> On Pixel 6 (and Pro), a Samsung S2MPG10 is used as main PMIC, which
> contains the following functional blocks:
>     * common / speedy interface
>     * regulators
>     * 3 clock outputs
>     * RTC
>     * power meters
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: gs101-pixel-common: add node for s2mpg10 / clock
      https://git.kernel.org/krzk/linux/c/f409bd20f0a94ca4eece7eb919b800e013abc043

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

