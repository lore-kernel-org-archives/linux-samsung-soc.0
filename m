Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469DD280008
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2025 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543804; cv=none; b=tl1vVy/E0pLxyTeWuqaTGc3etatWVFL5ho7vs4G6W5Fg3MKpsEDm5p+oKMvz6TJifqRKZu4+t8ErlZr1lPARxredwN6gtms2H22gaSX00frrSSNZjA6mKy5rziF7bFOEbLeydUsHkq4B13MsVXjev3ycoX+Q59ccBGrZsBn4ncc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543804; c=relaxed/simple;
	bh=fy2npRMTfmjjPLmznoZQcWxLmt/rqxFEr87E/XoWX84=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aIhIg1IO90oZhetfPHAx4Z1jlNJ/3xbrAZLJkEd9LqNjojt6kT2ZV5fCyzC39xahMhhDEyaqoN51KzTgZXlmGHeF/4NwlqzW7MS2HSUfgCgsEOVlUa1bM98fsQjupyEnhvgzMTOAcmTPuM5UR/Z+mFcMlwCyC4XaPWrsGOC6fas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e8SK26Ec; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e8SK26Ec"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso5388525e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2025 01:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543800; x=1750148600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juVrDSxpmMtgoJh5pc1VP5Zj0Ly8Ck76E+2hldG+2FE=;
        b=e8SK26EcwVhm2+m31rjjb3YQitysUawGzo+63k6yIDYy6eCApfJO1CmDQdhQz/8tvQ
         ijBHklw4QdfohPp4D4s+0du43DzLwKRmNkKEOMyGi1GRLRs4b1tBu0IjoMN/eUYLtb/l
         t9CF+wZcO6xau3he2lg0G5yKo2PavJXHTNo5ZLhnjBkoAYKAkRTHrBodTOWaHgo8NPPW
         F3LfP+PRn+XRP5c3KDAf4UBUm9MVYbUzsqZxr3bCK+FrfDMmir8WDoeXR6dTLKWArz44
         fyxqH7z77tIJkySWYJ6b7o2SCSuw81qoPnaOseC0d6ey7OWLD+N7gbiOcAFGR9po9ib8
         W53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543800; x=1750148600;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juVrDSxpmMtgoJh5pc1VP5Zj0Ly8Ck76E+2hldG+2FE=;
        b=LYESLQV+ExR6helUB0eG3H5S2kcJ7KHEFNMmvrJGJvLUsqAnh8l5g1s2V9J7Y2F67E
         f0SKeHWosDiBEH2Br7uDDXWqhdayT1h4bBc0fwhNwwgH9BrCidJrS5FX6IhDcymvzbXk
         +HpTpph4UbHwbxbkPClC1qIa6MwNTGWVg7jdM1VQhg/LeOpKGg4W8voJ7umMMqgyTe39
         EnZRB0UNEYd+QYucDwAWCUDCVi81oyMzbVjOK7UpMKbDTpclGEG9EXlHYrw8vXjU0+0w
         buToRUGQil32FMNnh9MpU5M6goaAPGg1joRD1QvyhyDzBNSr2AEsr3SzP73165qvSp9U
         AErw==
X-Forwarded-Encrypted: i=1; AJvYcCXjq1zWOtTWMGiIN9lfTDnKfegozZycu6kDqHRFrpZ0EVh8wcq1ReA/SxZgnyCtXh0CCVXoepsH9vizFPDwcwvDbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp68j08+PR6DzrtmfrEeDzKb/AbglZ/dENGvxTKR5WFIQ98naD
	rsoWgMQcNnz7y3eLxL7hPrznqBWKeKEEeVyeBAijSEsNbVmmHxgky8fIq70/J9O0rAw=
X-Gm-Gg: ASbGncux3OvUwhsC35dqQJPu/7ponkcSiF/rI0rM29u6qyg/+wW9W4hP6sHF47C1lGu
	PbZTBxm4YZyFtlfX5Puinjf1Tq6y+GVAm09yVEN5yq1IrDzr8JoaYTK5FcZKB6yjFWExc/sYobA
	WgfDpM8MOnZ09tMsB/ChIO93FqtfSnEoDwJNMqNEz67OPV9E4bC+GeBlMXr/GedU/gfJHdFuvHj
	EcQoMtalBSUt8M5bjxuFXY/iWX/2x0+0kgn4ZUNdGOk74SboyZRPFueWTaYfpMao6hSBM8C9qWO
	KLPe3Wz6FnR+Y6x1NLhir9eCyFKgqq77AV+Q0LDZS5YrxpLvGtnmn5tlqa4SE+1v70ePQnZ59/S
	rbanrQg==
X-Google-Smtp-Source: AGHT+IHmkbNCG4AE+Jw0uIEU/GxFnvKzXvXYiz5T9eY+25yhF+FTVYqqY/1/ANURHD1E3O5PMpRiXg==
X-Received: by 2002:a05:6000:4313:b0:3a4:eb9c:7cbc with SMTP id ffacd0b85a97d-3a5331ae097mr4937643f8f.15.1749543800578;
        Tue, 10 Jun 2025 01:23:20 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de01sm11895403f8f.11.2025.06.10.01.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250525190630.41858-2-krzysztof.kozlowski@linaro.org>
References: <20250525190630.41858-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: soc: samsung: exynos-pmu: Constrain
 google,pmu-intr-gen-syscon
Message-Id: <174954379928.117699.14584808679236287569.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:19 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 25 May 2025 21:06:31 +0200, Krzysztof Kozlowski wrote:
> PMU interrupt generation block is not present in older Samsung Exynos
> SoCs, so restrict the property to Google GS101 only.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: samsung: exynos-pmu: Constrain google,pmu-intr-gen-syscon
      https://git.kernel.org/krzk/linux/c/952a81b137473cf679c229e7e7e175dce715cd2f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

