Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971A1A23A4
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219024; cv=none; b=Bz5dmH2XNiJ/98xqE8+S4rrXxZqjpf/arE73+/e8DBnum853ToknBZwwzKsaSqFosHfo9A7nZhBd4gYSMQc1Hvot259ukNTh2SJ3jZWOeE1LJ78TyK+JNYPaFUivMo6OeHGe50CQWOVdPhFGVvziAFGomRiYo97AgaJXNUa9+xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219024; c=relaxed/simple;
	bh=L65734uuG7ZptESsrv8YJwSbh6bdHqMKBc/tnac5Vkw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AW3ej3T8s9MYHTHzOf/gT7T8a0xi2QSX2pIGAnaIlE+w3t/U6kmMO4IXvxy3O3RhtISSuQZDauO75tJ3mNqkNYdnXkmyWG7TJwJ+dkGrE9WOcLeIcpJG4s86n05ElGAnM7rP7ND4Ry4UWlUejwj+aR1jU8+IfVWrV1fM/vo+bfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWyY53yG; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWyY53yG"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-696bf0e7c9cso2229348a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 05:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782219020; x=1782823820; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wuxR7/cwC5PXnlH9Ywf/Xu94uq2eGxYSfkkCZirEJFQ=;
        b=bWyY53yGXM1YKsIh7E7OYfJZuSB7Dy8241v7TErTlJ0FSAHpcLZ5SBvsaqj1t97A0q
         ZrojoxPIaR+9LTXSvgB3IwRC5us2vnnIBz/0fpHBrIsEFotvkmi97P1v9Pa45zKh7tqx
         Zv0V52FVgY6jcNHqpdDKv9yB6SInQn2uqa20uXG8HsyBD2FXqM72Rpb30qucfd28y4co
         t/tIZtsi84sFu4SDKag1t2beLTa80ClT7Vg6/RRcv8VQD4fhVhD/409Hrxi6gIC4DL5h
         WAGo6a9NRigWYNY/1Qtu/0JWpvAYGaJ9LCCCBl5S1FpnUO5SPMDJsyMFa4PK1WaFBrhd
         aFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219020; x=1782823820;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuxR7/cwC5PXnlH9Ywf/Xu94uq2eGxYSfkkCZirEJFQ=;
        b=bDxfIgIiZ042ycdBd65th7Vh8TFz3BYciEZfMDmJ4XQy6o2zgVzAsq9+YnO20X9CCd
         f5VaS6p5yjas3HqM2hkZKSApsj1SqSGsMLkXEZGBLLsWG2OtVDzGd0OMsXq8DEd55/RS
         A8qWUe7L4XoJvrD/E1jrfti+oYoi+YXifJUIeGWezGLSOG9+2Nsr0qDXLa6fp91Y2KMQ
         h9BYU8iz+VWw+SQISp38CyNIML8XML5SwfUIziXdbrv8wxM7kUEe8zdxGa3C6CABs0j9
         YCOSMRaAPcI9NLGJ1UJFuAtOM5/lHEAFarphN3Ty9GpfSX6fVI0ZZTULX722CRuroLi/
         J8hw==
X-Forwarded-Encrypted: i=1; AFNElJ/3c1RefkFQSGAnu7SP2TmjGTxbnbf5IKZUZ/n9QZCyQ2CVJax9BwpUfWmaSLl1jxFIRgUF7w8YK0Iz46ulQ6KOhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfACiaEHALa1yz6EvgnWrkdNLllg1rWMuqqMTkFmdhsrJacsSS
	FNFlQO02s0io2QbvabZgjgeKKL7ktV9eLeBm/Pe7+FzuxJlCsjywgQw4
X-Gm-Gg: AfdE7cnY0MQBKKuc9GsBCp6DkURVSHbPYfVQwRq8cUnt2Jy6R4KXm9K3YzcapnOGOix
	xFRPc4+lXs/zJ4hFDtfY0jwZY20bmU7+0dCvvtThhQjd2nu2tFyy1sDiwYPrQWUJNzH4ViYqc0B
	r6/3BWw2pMEDW5eA7SetHEa7RqyqSiDJ96BEebOoc0Ivo8eSUULiGGxABTXxcCbH4RzBLEptHeA
	z/5pEzYMX6szFO9MJSEkKCGipVaWQJtbGyyf+NC+rIBIkSq9H4GbI0hoYJs+sa+VIGPbOWov1CV
	rhjGyO/ODaxTFACtisDhne6HrwT1KKWFGOC7Rkto59Ni5oIkJsOHf5ChXawuGAX+mJg0DDyj+Ct
	56izTyESSYqDSKVXQi1jFu0hX1ELX6z8yvCAq0b3S7y2wWAXEYTpoaPQQMfw4PSnU84YslNK6Uc
	U7Muswsns3yYiYWSK4iJSS
X-Received: by 2002:a05:6402:52d4:b0:695:defe:bad with SMTP id 4fb4d7f45d1cf-697d4315842mr2072027a12.9.1782219019350;
        Tue, 23 Jun 2026 05:50:19 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82fd6fsm5153967a12.2.2026.06.23.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:50:18 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Subject: [PATCH 0/2] drm/exynos: DRM encoder improvements for Exynos
 devices
Date: Tue, 23 Jun 2026 14:49:42 +0200
Message-Id: <20260623-exynos-drm-simple-v1-0-bb52f098b1ee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOaAOmoC/x3MTQ5AMBBA4avIrE1SRf1cRSzQwSSUdBIhjbtrL
 L/FewGEPJNAmwTwdLHw4SKyNIFpHdxCyDYatNJGGZ0j3Y87BK3fUXg/N8JxLPPaWFOUTQWxOz3
 NfP/Prn/fD3HAptRjAAAA
X-Change-ID: 20260623-exynos-drm-simple-bb5386d64597
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.14.3

This series does two things:
	- Open-code drm_simple_encoder_init() since it is deprecated
	- Handle the error code from drm_encoder_init (previously
	  drm_simple_encoder_init) to prevent silent failures and
	  cleanup of uninitialized encoders

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
Diogo Silva (2):
      drm/exynos: Remove dependency on DRM simple helpers
      drm/exynos: Add error handling to drm_encoder_init()

 drivers/gpu/drm/exynos/exynos_dp.c       | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 11 +++++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 15 +++++++++++++--
 5 files changed, 57 insertions(+), 10 deletions(-)
---
base-commit: 60326b17f877e12846167bf8ef83680b9875218a
change-id: 20260623-exynos-drm-simple-bb5386d64597

Best regards,
-- 
Diogo Silva <diogompaissilva@gmail.com>

