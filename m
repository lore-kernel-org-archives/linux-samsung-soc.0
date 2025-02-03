Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE22040B4
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Feb 2025 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583963; cv=none; b=iPmOMtUUiuiO+nBlvnuTV676Dfyw1zyiuzOQNUBnuNpdN5vtRhl+Evmyl/fr2tV6vAXwVA4D1P653emTo7n+IvGjhwHfxQIxoW02IRZkZrPiaX9ZAqGDTXMPQBfWcW/Uo/wzZn63LIYMCnKDf/jSdWXdC3XJYaiJqSyhqld/ASE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583963; c=relaxed/simple;
	bh=dTiccqNMsBZ9GLf/rRlcXjyxCYlLa0GCTN2weEx/XUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZPRwOJk2/qx6E6a7ehTkHe4DYTUIMXzxyWJLcB3yAYFaR+HH85or8j8jKxC+U5opWLQ9niWNPuDCM8R1rdE864T5YYtLoCh4mqy7niBpX+6V3TjO6NOxYvYGM3uEClcdEjeUzewqFK3EM3TKGeqA6jCKm8e4v6Jpos5EayIvvXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VR1bX8cV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VR1bX8cV"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso6584125e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Feb 2025 03:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583959; x=1739188759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2a/aauBkaXi9NTmAe9snehCWmybkBs6Bj8pQwjYW9I=;
        b=VR1bX8cVD74WIr7I/G/j9v82tCGRqAK2biPjHVdO+81B79IUGH6MltymvI5MgjrJtC
         lvqpTxNKOsrNMWEEJJdrt9I90O0QTCFONN7F+a4EBcmXlDCi1BPsP2snQK/dfgoZhEAv
         063/tOtMpcgyJn3HkGUy0c3tiLTqw5Mgwk72IqzsydVMErF5RirGLVG/GtAepYlpZwbT
         Dj807TSSNvl8gKO2xzZ1x1RzqeXd24VKwPUsjtPIl7gDzbZ/IDVTHoGfKHGD2yFIxAek
         NuCLucWmb7CnmFMREMidWevTcW9AKaPY7Lm10AyYFXU2grUX0cIiFNYyH5vyRzceHE5Q
         pehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583959; x=1739188759;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2a/aauBkaXi9NTmAe9snehCWmybkBs6Bj8pQwjYW9I=;
        b=S4kF/+Bn7oeoQIjti4jIJ1fJchJK0MlfW4/SGJW0mwiR5Umb4XE082339Px26OUkc/
         s1n0bCZqxTvkqLhAgj3zyixFUVZhsveKdkvEnp3+aFKjUpY9EwQl0ix7eG3ihGeHMdwg
         9n69+tyZtLeGoRmnU0wuCO9FkcoXt3eWYvDVx9w9Oy9nWiUU/HSOdDLHK34bX7mdLgj3
         eJGmv+yWOdnw6FtNjZFDrB1lO6GZRjbgJFFxkmAuUqd3/HNfMofIw37wW+6oagg1XcME
         BNuiJeVx4d6cG+tre7DMaJu+MLuVwlWjHkDtD3FivvhX0s0Nlh+2ynaeBbjHqlYbvNB1
         eppw==
X-Forwarded-Encrypted: i=1; AJvYcCWAs4CtlOTT2zdDWX7koWwVi5hykRe/qoYCwqPtE/yWs5Xa30S4vrK40XrrZE1ll5m6hEvbEWjLGK60Az0+oQEOkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtKjYtOSWaVjJGQevYVjOH4lN359L4yLEzqXmyD5rxTVHnGsNH
	LFqmcABX/IOByKC/d0n57JMx0MCj/BlR4790ljbeFWEJh4w+oI88QHkhS7ZEvOY=
X-Gm-Gg: ASbGncsXfWhcbB9AczYggB8hSo3yno1TMil01QzjwlqgocGHzKm5t1wvMrnt3eUn7CN
	CjngcdAfJL/1D5b5vWrZmVtLHFUgvVljvnLFtxkmuf+E7rs55mvSKDMVpMjCs07pGhcLDHwIz4e
	BZH70mGWyXEBMldQ714uuskebpVzPjGucpGFWSz8zQdO+A1l8xehOQnNZ/A8fV/MqbUwBkdRd/I
	Nv95Fsy/uvapURt36niIyI3c85F804x9buv/Do8oo99H/H+GPzbmPQgE2q4pblNWX3fPquWiNFI
	YjsLnGWfEn9GFu4OBPLW3ulmYwNvAhA=
X-Google-Smtp-Source: AGHT+IHGpchhT7QUazlfxFFqFayeGo2FoLhy7xxU/4TbchPpF2cuysjOgifUoOGGAfvTdFlGmzeQPw==
X-Received: by 2002:a05:6000:4011:b0:385:dc3b:da71 with SMTP id ffacd0b85a97d-38c520934d3mr6843694f8f.8.1738583959600;
        Mon, 03 Feb 2025 03:59:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c12247esm12921274f8f.53.2025.02.03.03.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:59:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, 
 linux@armlinux.org.uk, krzk@kernel.org, alim.akhtar@samsung.com, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250203102818.56747-3-tzimmermann@suse.de>
References: <20250203102818.56747-1-tzimmermann@suse.de>
 <20250203102818.56747-3-tzimmermann@suse.de>
Subject: Re: (subset) [PATCH 2/2] ARM: s3c: Do not include <linux/fb.h>
Message-Id: <173858395846.133675.14228724810206295943.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:59:18 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 03 Feb 2025 11:26:36 +0100, Thomas Zimmermann wrote:
> These ARM architecture's source files do not require <linux/fb.h>.
> Remove the include statements.
> 
> 

Applied, thanks!

[2/2] ARM: s3c: Do not include <linux/fb.h>
      https://git.kernel.org/krzk/linux/c/1fdadc8418bebba39899f341c3acdb189668e7f3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

