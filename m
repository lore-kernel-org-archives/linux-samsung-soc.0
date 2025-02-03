Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31A920371E
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Feb 2025 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583961; cv=none; b=GBxIeE26raBHgWvSYXWHVsJMi39fQGevbmAKLX1hB9xBskVJQuM6olafvjOMvT+Jn7MKuGnhmK/V3l0Ln2Z+OXAgw/Eq1652M2PdXhnsv3MTO8ePpB9CO5v9RU+SrXhr5CvWuhxOFVxQDth49H5Fb5wlWnYKhF8l7eH3WquUGv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583961; c=relaxed/simple;
	bh=3NcVFj349lyJfGOL+vdcgKBeFtROFl2Kj/Ur8lBQEhI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KEk/SczLF/A5rD6Udo0+2DNNIJAeXW5hsmUHO5592Ct218LiNHTzytLsxOhEyggHarP4KtFyHyktMSRWhsIBlATEDXbCOUaJ1ReOSyZB17u8F9C/UWRY2SZ8UrVFXpRMTKFlwyrqkE00sTL8WAIGUkQjG/hgBats+2AGbyMP2aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUDqQTBu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUDqQTBu"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso6584105e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Feb 2025 03:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583958; x=1739188758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4w6z+wwJMdG8nN9Qcvb+agCCZc4JaIRFTNtg95ls2M=;
        b=cUDqQTBurQiy70pQBraeb0FsyWcYYdtCgA5j+pFbavTpZqrB6dreTagV69q3lCCrJA
         Xd84HBtKeVBRXYscEkp27tFjLaXQ4UFJ0YkxiJrrgO2xCm+KkKFiayJg5G+6zOohZv04
         WybjHaXi+XKmhM4PGhBEzmiqOKPh2i4KmFbyyPYMP2MRiOLvJcA+MtpdfdP6AEOHLBr6
         /WjqZ0OHDL+VU2mxbuDw0M2oTi0Xh22HPOQCAYdKXUMpanNaw9Z6yJ3ESfRkhoqeRfrR
         ideWrY9SbcZbdxBp2dIcNf/UPzB35KtikDFAwVRefnXGTx+2+6JGdu7DgXtILbtNHgVL
         m+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583958; x=1739188758;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4w6z+wwJMdG8nN9Qcvb+agCCZc4JaIRFTNtg95ls2M=;
        b=KxEd7o0yL/cO+OJGOMPVWQvkQmlFF7JPOU3YGMtwrRdyBo3ngYdoxQjTrvsGcVox5X
         CaiNuc3j3PQ3LjZqxLfpTFsS6IhngI4sU4D3O581W0Ylj9Ny5VohWInj80SA7lhlgWJf
         CkgJGsOcKIPqxNkGb4Cycw1kzSIpDnE8ybCkLG8IELI51Q+QBlktW3HIcS+TSz9C/Ncx
         Gry6Ift0yuyhwnDso7htF4s2sWrcMnECCUqLOSp3CRJ58PF6y6Nz/JjJ/gvEQwbVt9QW
         ONzl5qB5goUs+heFPecf4rSk64gkeonrp0FDzRFGvuaX0IkAm21AVAy9036cwASiHG5K
         lptg==
X-Forwarded-Encrypted: i=1; AJvYcCWnJM7aR6+2aJLbBfayie1xbs8vS57QbQDJq0gT6sr/obyv1eAiQEnSL1uGRvtnw/0JTCzP8aYTGBgbW3rjrwjO1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3UIwesxm7CsAe+v0cDz7EGQAmM1KWiW62daOKgUBxKNExESjt
	5wza6y1RaukPFhPWpMqyJSSlJCEHMyqNU1HF2vZh0m1oruWiOfym3o+UIZUMjzU=
X-Gm-Gg: ASbGncvvmiGqp+1S75B2fT9N5NLtGorwA4QP8B7grHUGSs63SNLmMbNTvPxj1YdQdg3
	sxlVzDiVPEsjVaCBWCwrcPpRhnpx0MN4extolhHo50Ua1FmBlIhxcJUPO8HtKFcZQp1rlYDnZYG
	DhsQTw3GZBMXkgSCdAow+s5tTGQ5ZOqvswu4akJd9Qmw8HcHqavbacXw/xWVTAYtJD47IqWvDW/
	f0zwi526IxsOQg137l4uDWWNgHB+RTKr7h9gZn+qI4z4xiJmMiEjZYVjcnbLXZyCFKahXCLM6TE
	08oWFx0ZpoyJ5RiNVAj27sq4wPWnJAs=
X-Google-Smtp-Source: AGHT+IGL0xSElRrwcfKwrUUF6e3pFFAp10ZvxPXdfiqbtaqax1cgDagk0qGOXhxfUjZX4jjdbpXMsg==
X-Received: by 2002:a05:600c:4685:b0:438:ad4d:cefa with SMTP id 5b1f17b1804b1-438dc3faf7emr70962115e9.4.1738583958145;
        Mon, 03 Feb 2025 03:59:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c12247esm12921274f8f.53.2025.02.03.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:59:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250111185402.183793-1-krzysztof.kozlowski@linaro.org>
References: <20250111185402.183793-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soc: samsung: Use syscon_regmap_lookup_by_phandle_args
Message-Id: <173858395687.133675.813378795094586109.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:59:16 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 11 Jan 2025 19:54:02 +0100, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> 

Applied, thanks!

[1/1] soc: samsung: Use syscon_regmap_lookup_by_phandle_args
      https://git.kernel.org/krzk/linux/c/00c1fda73df8081f40840f860c8d75e2c9070d48

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

