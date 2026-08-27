Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5259E3E638E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Aug 2026 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838598; cv=none; b=EM1tp0VxPe+f81sau36bqVWldrDKb+SI6YG7XlyToFqRWAM8BjE9/XirKWBjJfdpUEY/nMvEWY4RMsT1KSwAd43i64cj5yMwvcuTAcQ3RCWXzSvSZpKl92vmRN9f4JKsfAYI/w3+OBORUVWBCOI/Kt3ERJ+P0O2H4jTf3UH34yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838598; c=relaxed/simple;
	bh=7f+4mzELTObpPjWDb2bQLAcMvXmQA6lI634JqMznuyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXL9395pkB/kweh2/S+KhuNKk8XGq+lzJvcSIRIWsRRBgfRSvgYwSU/TLEFsnykVQg7vF8C+9Z/UqcAw3XX6gEHoeJKNWUnZSudqyjxCH9wY3SKTHgyfXCkTHDlly2iGMXpJ3an8N355A67GSujH8tamk7F97PITfHkqxQRyhJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqTCB/FJ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqTCB/FJ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso943513a91.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Aug 2026 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787838597; x=1788443397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZcqJsOk8WyALrofDgPKRhkK8TJsmoKsFAfVulwjePPE=;
        b=pqTCB/FJx7Ds0Y8GAFkIPYENfJAg76A914YUq/vrCSMp8nmW1CMO1l6nIs6IQmwyvC
         MBXoir4myybcXcmaU67ICh9sWNufwBGvP8vzxN3/FBZwfOafzpW1PcXin8trFA4vwUPB
         L1PMvUvTz+B9npMpLyC3d59tfiQOwQ6R6w/yyyciW3Bb8bqUmA6g7BVuuLSHXM/6rPIx
         jgdfi80Z3eLJ4Xk3a0BQGrTv7SyepE1LiCMrsMC5JbjkIUZmkCVc79HeRHBbR4h9nAzi
         rpKBUXaPxHqLse34y6bvKzqJl7lHp/lPO526H160GUVD+KUsyM2AWmXSKDjb6IMnITWd
         E71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838597; x=1788443397;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcqJsOk8WyALrofDgPKRhkK8TJsmoKsFAfVulwjePPE=;
        b=ThMZYw5ElTbCTht/3mhT+st+5YRGajicXwrhPgE/M7SIVFazENGG/l3hHdgttiFXgV
         tWyQx0IKqaOTskq9x2Ef64lIP84GxVHP7GF61l71FCS3R2Ga3gklH23zG4FlfCxKsCLT
         qXeMwdJHMwXzhMjTOikByIGEWZ5yrZHOs2+2tSuuZS7zFLzEEUIVOa766GtUw9ymyr2u
         5BAabn72sz2g+qJ+pu8vO856P4wQHXw40YJSszTzJzYCNXflnHu2HKL4jBPxpca5lMrh
         VslmOmbzglg9MT1I7tUjarbsyYfEVm84rB7Rl1p5D45uPro1t6RufqOQJbbK0GHEffxB
         niaw==
X-Forwarded-Encrypted: i=1; AHgh+RqKQe6F68XJFwS0pkVeiUE5fqso3MHezIqKr1wZ3rQBkku//54/imbQu0a/r6Oko8jebo7YuQB5sewxKTU2qdihog==@vger.kernel.org
X-Gm-Message-State: AFuF++k5LdBzNpFip8pnWsdz3zSZiMaXMEfO/mFXYJ0SFX7eaufeo9Mt
	OuGLJsI4pxbr+nUe8Iuc5Yr+kskciFKPSRheolQim6zQ4mPW/J+GD/HX
X-Gm-Gg: AR+sD12X62g+mZVbRhk6NzSkojRhjQc2NN0bxuaVItZY3K8uK09shURM2HSb3U3hIg3
	8crUz1nx/3ImmFRB6Q/R3Jddgtet2ur8v5/QGz1rBRRaqMd+2L3gNth1IDT/+ldUo1M6B0kDNZR
	v5IZiDoWk/gKiKAxpvhfP4inNb1URiOgDdXjycFjFWuDlv6qmJFdX89kpxxp+vtxnCYoEx9Y9qf
	A9zTHztzjr53/Cv6R5RrFD/r0T8vctuAYjagtT48/+cuVMLEX2jg3LuoDMTih90Ae2DWqaMdclA
	s7VeIPV/IYWYVGZb8SKdZz6jv9gvlrkcvng8R7Lmi9/jjlAnKL9Xfl0ufk9Abz+q9U6n1VzP5SC
	ePyBJND6gMRgvPgDavaRz3KVKTrlff6SDdrcUsHuNpWLysrltWJy9+t41P6X2Qak3s7iQKoTeVY
	vHE4/zYOU5gYenN2/c1NRJU2Ih+LGmclv8bKn7Ezyw+hoDBcH+zgrc7zlFW3EWBwNYuty6sy831
	g==
X-Received: by 2002:a17:90b:3949:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3966cde3f0amr31804223a91.0.1787838596310;
        Thu, 27 Aug 2026 06:49:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd55a4sm2941117a91.7.2026.08.27.06.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:49:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 27 Aug 2026 06:49:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: samsung-wdt: Add
 exynos5515-wdt compatible
Message-ID: <a7290d71-53f3-45fc-b9f9-f7982bc15b8b@roeck-us.net>
References: <20260821-for-next-lucky7-watchdog-v4-0-d070cee5009f@member.fsf.org>
 <20260821-for-next-lucky7-watchdog-v4-1-d070cee5009f@member.fsf.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-for-next-lucky7-watchdog-v4-1-d070cee5009f@member.fsf.org>

On Fri, Aug 21, 2026 at 04:14:49PM +0100, Aiden Isik wrote:
> From: Aiden Isik <aidenisik@member.fsf.org>
> 
> Add a dt-binding compatible for the Exynos5515 watchdog timer.
> 
> This watchdog requires a syscon phandle, and the cluster index should
> *not* be specified, as that does not make sense on the Exynos5515 SoC
> (due to it only having a single core cluster).
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
