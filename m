Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21EA417BFC
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Jul 2026 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895813; cv=none; b=f6AEnkucdhxQ8sZNCLF61QR8yBbi+hRy/oAcT+1oQrBqausFoLQesIDun9YhkPZ2ktlROTXtIphmfPK3iIO/bJbJXn8dKSeAN7J3+DUK2/DxvHSrcwVKuZRuV3aNqY39CjuQPky37HCurY8VCjF2+cVRkhLI/TzJbFuaxoegsFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895813; c=relaxed/simple;
	bh=QqQ0c1cxoYl2N2Q2vFVFFoPIeqLYjgaTaw2HcL81u74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONxbePo52/XRdP3Qcxois9UY03k5EULyvglbJyUDso7Uc8qqd7Db8TW30z4xHriM4e0yXbawtkaeulyReFzxFHP8kI/EGaoxi9c2nyOA7DbdqZru2F8J0zCE2e5DKB2BcVedthy9vFRU2riL270STuIvRBmI4G+42U8KEG5SfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFpMZ12V; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFpMZ12V"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caced6038eso4479035ad.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Jul 2026 05:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784895811; x=1785500611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqQ0c1cxoYl2N2Q2vFVFFoPIeqLYjgaTaw2HcL81u74=;
        b=iFpMZ12VoKWH7Gq7MKzV9+9vMWElPJva3tUMYsVJSTbTa25zCRwOp0tWHtTXpP+9yP
         sUxj7BJp+whBck1QyhqKtCdjQSf/WSFqAeMAve39BIifqQo/wmN2h4r6O0busYAPDa4l
         P6dJHldhTRcWeoSHUeavmkOMpQoTy9GVds1H5KlYmN/JgWS7xdpzMRfcxjt0rLvjtQN1
         HfzSIaOiG96KwOTSD8NpGtje1L6ZuQymxxWKvy4mCaqiJpamvA5EHSgvJ4ppTNYzVT2U
         0kQwKLpHCa92fU1bNUdC/dKYStnSfMTIVjsMNU8skyeR6LGoddVN0opKEv2GVi/8v6OZ
         dpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784895811; x=1785500611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqQ0c1cxoYl2N2Q2vFVFFoPIeqLYjgaTaw2HcL81u74=;
        b=o1uf5Pf+Ms0CRwaXaQJ1uywM8rzAu0qn87KDXn7eSgnz9BzLemW9qb2uGTXG1uZlxa
         3E69t9H8Z/XOgC11B5ZzmHs7S7IMgL4hc6aFu22fme9ZVkyRKhC0boDa01lntir2gTXn
         cS2FM+EJ0lDIBsgNFGzFW7lcPcdHAKsyFMDnCZPk1RziM4XKANxEaB2iN2qSP7ogffNC
         5ddnZQeZIqH/zG4wQhrAGI9YLmzFONHFf7bxYsCVoMOEhMjv43ZzOS0Gacg5Dq8BQsw2
         v2RZt6kymw9+4WaDNNvGdDqPbuJxUfNbNfkKNNDWWyM4WhcIAAWOUfS0u8A07YGsVqJW
         AvjA==
X-Forwarded-Encrypted: i=1; AHgh+RqhFifH1056QT/Opag/AcfE82MNLIsTWjfIxLO3/TOg3X529OBsYXEpw+KE5mcZsQPbmDn/WiW4QfxUZrtIbb1S7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx5WP/ylTD8zKrnzwb82LVQClVl53KB16oJy8yzqjnBajEXJF5
	jiOhlFFQ+tcgv2aDvBltu/rfFNYlB1zxByPglcjWow54HOIrM/y8PjTZ
X-Gm-Gg: AR+sD11HGuSO+9y/5OdNRhBsKtjwZWjmkeXuCMJ/+UUlyKRUEIxjEhpS+tXzbCRnMx3
	ljdnQv2jkuiWCKRo8lVIlP5zYHRmUjQagev/iK5CqmHhzoCKYV09mDYMTxyIJQsDTcevZDCtBHj
	tEd8/3jz2saQqCX5w4TE3C6C1eaoWiYkdINmIaeSExIEv0poO9VQ+G/6LCA9GW0RlyyHmZjhUwh
	RGXkXGU2QeMe7TtFr5kEHbx7RuQe7qwh+t1V07z1A5oWiAeM6Mi0nVdxetV32cRxVuUsr6MlKk0
	2rugfjIbTWGcYKTjfWgY9LBEH54jhNF9mZbt3hjNZnNDVpDUu+r+fXWNf1xs2X2I+qRX4cdCTq/
	12C7SsdO8xwq0gNO4+44ul/3bMbU/Oknc0kgfZsVvHEJSEjQgpoAczaV11XC1Fj3b3GHIaYhDg7
	Zkc/jlkFgsRdQ=
X-Received: by 2002:a17:903:228e:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cfd72c810emr2927585ad.30.1784895811180;
        Fri, 24 Jul 2026 05:23:31 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:9261:769c:50a5:6d0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081985sm31448346eec.23.2026.07.24.05.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:23:30 -0700 (PDT)
From: mdshahid03@gmail.com
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/exynos: vidi: use memdup_user() instead of kmalloc() and copy_from_user()
Date: Fri, 24 Jul 2026 17:52:54 +0530
Message-ID: <20260724122254.121935-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705110221.153481-1-mdshahid03@gmail.com>
References: <20260705110221.153481-1-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping on this patch.

Could please take a look when time permits?

Thanks!

Mohammad Shahid

