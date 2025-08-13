Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6D62F49F8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081434; cv=none; b=Bk8CEpDoiBh25DRTWWxXGNLmbidJRneiw3D9tU+Qly91TXMWaWvskDhVhg3aN5yRc+9BDhfH9G3xYIzg2LtveWL+GouPEqZMiK8Gkb8iYc8eRIoFnIc9H3rdiQuOHtW0E2HQp5qJDjO8u94Pq0KpNZbP5KQ7wW58M4RBlzjRyiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081434; c=relaxed/simple;
	bh=+IyJltOGWI4YsBqQdWg94WDQvBdSr+uLkjBcwTJ0CWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W7RmOuX4IaDHhvGUz0oVKe6DsJcUaHEr/p2FZb/4qXqmxD5Yn7+OQdqFTDYAz65kkr4TL8z0OFXtZzcQ5hN83RDjDuDlftQ4JD18ezTankTonQTKU7aRCiTHqpckz217GcdAOUDDKZ0vQ7Kj8iKST5KDq0Cqegwm8L0NRURPVMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lzYsouGN; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lzYsouGN"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6158c9766f8so1062874a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 03:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755081431; x=1755686231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/I/UV4/s1jFi57l1/zTRTSQC+EHyYYP8Y1oNeYIevY=;
        b=lzYsouGN6VgXWAtp0CeYJjYZhDy3TcvZp823W9+fd3EW+pjCrV3psL6ud9JWJ9IveI
         QaneawJ1t2hacXq16v/4wp5NbHTONcK56dnj2PdeF4nLqstOsm5niWmkYfZDQyBZv1K3
         rgH2riqD7KJ97EsLfUnyQL6hgAC2aMWgkMZf+zPFN2mHAJcPVajIZd4E9zSy/VGhgod7
         vQ/HgPLig9i4/7Clbob7iZWDmiWjjFkd0FihWZ14+P3iaZZNTEQ+zBxAgUZeDErnNOdK
         oXx2X0LXZi68s9CLbllafZA3RM8mqMgMT0tf9vh+RhG5rXmKqAGc5cyzMjcWWxksy00/
         q5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081431; x=1755686231;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/I/UV4/s1jFi57l1/zTRTSQC+EHyYYP8Y1oNeYIevY=;
        b=RRMWlMSowdt7FxQ340PHN18SzFRqbyb9wl7FIBbGF69yw0282usRUiHP4CmRN4cYjH
         V9leWaAXspfTH+yA1BS2Lttl58qJZucssu4a4Rs23QToPUcNKgwx2ma2vgBMCGSipSRF
         /c5M7xXrw1F8KvOnhHjJQfdAoCEkvGRouOxZ1C6w444c+jkNvMgh8dDiq2wnLuaqSEmq
         VygA+aOuazDTlKepAxtpSGtC/lgUxTTerD6nfIet/n0EL18rvcKkt6IXDwzbZd3yox/8
         aYLY+oWNpikE8ys/SkWLGjuM1oo/kHW83RshjjnvBwHcgVrA/1NZgM/GvPrJoWF+U7a2
         7qBA==
X-Forwarded-Encrypted: i=1; AJvYcCW+udxdYDUmxTCq3jFkrZqiN8Ziw/b8z+M7xtyGZZ7aZ6fAE+fmJgbdPzo78qbqOtwZlj2e5z3rVr7sBG4hWTRMUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuWRERzpkTV+/eLCiJQI5fg4ceiPtFkJ7X1Fz4fCKPysxnoS2r
	NO7IEz6tgf/N1flRVq3Hhsst03uR2HRhsAgQWPAdzY8nswksTgxgKAFzMkMbtgDwBUo=
X-Gm-Gg: ASbGncsInDOkug6xKNGzfZgVYjYqmjX+ay21mzYh/lcEzVI+NBOyiPuO5xltMDnlMir
	Yx/i+bbtUttu0qcVwRyw3ewwoGfAyVFHnfnvgvEp0WwsuaDxJQAeS0+b/kWSguEhH0KOPEXK/Ik
	sl/A2kXizNByFrLblURDanJYGdLHELB5FAT7ajIkw/4bQ8yVPBANXoDqnE90pBl1R/pFVXdDyRg
	LSTPNGwFMcKKB/A9HAIZc8wM1DZ2fyDjODgrV20x+NZhQULww3lo6DrB8EOkBNOLr9ltwb2rzKb
	1ZFvbD3c3MQALCHVAbFSz2/P4YowGT+5qOxRAcbOQDqTPjy/Bj5fXz1UkpXa1lkz6hppSkoVQ5c
	PpR4bJSFdiGOA8s0CJsne76FLO6y3cugLLhqEKDA=
X-Google-Smtp-Source: AGHT+IGly2ZK68mNw/1W/aNJtrzffPyIHLrPFRXdd6pjFMKVKce3Kx6411EXu07l2T6GFNjgHfafyQ==
X-Received: by 2002:a05:6402:3591:b0:607:eea1:1038 with SMTP id 4fb4d7f45d1cf-6186bfe6deamr918459a12.6.1755081430915;
        Wed, 13 Aug 2025 03:37:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm21042215a12.36.2025.08.13.03.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:37:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
References: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
Subject: Re: [PATCH v2 0/5] Add watchdog and USB nodes for the Exynos990
 SoC
Message-Id: <175508142927.40586.1715682122583711068.b4-ty@linaro.org>
Date: Wed, 13 Aug 2025 12:37:09 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 10 Jul 2025 18:50:04 +0200, Igor Belwon wrote:
> This series adds the nodes to enable the watchdog and USB support for
> the Exynos990 SoC.
> 
> The watchdog consists of two clusters (cl0 and cl2). Unsure why Samsung has
> skipped cl1 on this SoC. Both are enabled and working - tested on a
> device from the -x1s family.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: exynos990: Enable watchdog timer
      https://git.kernel.org/krzk/linux/c/ad211501fff48d0cda35dd187aa7e356a4fb5581
[2/5] arm64: dts: exynos990: Add USB nodes
      https://git.kernel.org/krzk/linux/c/d3830b5b0db59d0b8e33083462e4c0dd021ed300
[3/5] arm64: dts: exynos990-x1s-common: Enable USB
      https://git.kernel.org/krzk/linux/c/707181264badf4f82c78c18348684cd06db31ce0
[4/5] arm64: dts: exynos990-c1s: Enable USB
      https://git.kernel.org/krzk/linux/c/32532687a9ce2f1c5556e082f957200a81ba0ad7
[5/5] arm64: dts: exynos990-r8s: Enable USB
      https://git.kernel.org/krzk/linux/c/e28c1117deda5a80df14b579170c1a90fc82bf5f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

