Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB232B9B3;
	Tue, 16 Jul 2024 19:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158574; cv=none; b=A63KTa0iTpfUYuCIV8Irstog3dScoio4GZju9EAr8/hERUneeDuu5wN4qIImoJSALNymP5I4r68HNWh1OCkY9UZnPkQuMTHVR4L72sGIezMHWhtVCI0j0tldYtcGiqC8AlFxyhj99nIKToL0+97Pm2mnmOa05YEDEfZE77GgWdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158574; c=relaxed/simple;
	bh=ApQiReT7AHyvU+PXH8flb42ZYdHtJxbb3rfFODudKes=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Quf80j/V89EwbOVC2AS89dhHKjVXYQUlWBqT1pS/x0pUNThhGc9I4HIxHtJKoNb/v5pcjJKbqrgtFo9LamtMPnv0DDRFHe2OBVMDFGgQuwIH/jaowa5KURZ/wATgj9T+jPctg7X0aeaoC07QjFlRLYAJS8beG938FcwYHtcS7T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKxhuXA+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKxhuXA+"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52e9b9fb3dcso7278057e87.1;
        Tue, 16 Jul 2024 12:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721158570; x=1721763370; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q41LH9Jx6BOGrYzApsnY2Gh5hkNLu535opGeJSAHtsE=;
        b=ZKxhuXA+EpsECXcd90sxjB1CY0MNd7q5eTmdKq9ZswS5Hz5G3f3h3p0Psn1BtQGRyZ
         nW4+YhG6Zb5goKIdBJ3gu6XciuTt3JaCAuwuQz2JdkU8/Jwl5QMpbQwtl7M3UxfxBVWe
         78+f/nlMblHGdWFyT+0syRYcfCVwqEnpDNLxJBx2Im9BrXWq9LEk0yCMHgpSpL933fvl
         U54F/pcZvO0jNN3nDDYiNM6CmylcuvSU+gGLkU+MTwu496RK9IAU3P7ToODeFW6Xq0oR
         UlKkkHyq3qWIb6XzLit6S6ep8UCn/jSlDp+6th6qQ0USMa86GULYy2NH3nXmaclNkg/5
         n+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721158570; x=1721763370;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q41LH9Jx6BOGrYzApsnY2Gh5hkNLu535opGeJSAHtsE=;
        b=GWg19zp6bEJvIFocurBMrRXO2Gwe7xAR0sO5xY1iCAbLXYtgz6TIvlTVG1NgKah+mI
         +XXPVgd4zrbdeLM6gEOjE/ihnvrlB6ltTousf/9xKn7diaYEmpH/0cqg8kwWTMGyVuVh
         lRhONlN90UpK7QwVXK9VGFS1hm9ESKMeWmRn2AWk22bzXNmBVRfyQYTNlbmEVxKSsiYI
         wCX084x5u4Hp/4PHH++68JhEj22O0no2/B8VtFwS8BdODho8pcQv71ogJgyuSYMgwELB
         VlG6kbeqtbWPt1gXAHWdmLTjDZmwuTuuZI3F5O6tf8JKneYirQjU/+JFvfxGAwmdkQIC
         bhsw==
X-Forwarded-Encrypted: i=1; AJvYcCWhjIvkOazHp6IgHx4JhSOGFhgbDHU74gBDuHU2GPFzwhpRvxBh++JjwgQq/2t09iFb52GoTkQ6A9x+xWbVTljA/gF3xol2wNwhC0DOOdQM27v7dSrTAjpGWZHI9kgazdebRnKZG8i4x4zLaLVkQrkjQIDbyXTWKLNlMoaG/GDChnbVVZuefweGgfntpg==
X-Gm-Message-State: AOJu0YzVsJrTlRHaXEJo7uguMMPIRezUydjGIfvKo1Ak6VnWoChOWk6o
	Hgjtj6lOwgicFTjVXUu2+gvL8mHejT+89vB2OFnqddD9MIUpNTuN
X-Google-Smtp-Source: AGHT+IHRMe2UvL72S6B5VNJoLjGbByy4ngPz+XhG/UmyY7wDt1Eya0cUhQIc/k9C/j2M6j7KWuIGkQ==
X-Received: by 2002:a05:6512:398f:b0:52b:bd90:29c8 with SMTP id 2adb3069b0e04-52edf0405a1mr2301337e87.60.1721158570033;
        Tue, 16 Jul 2024 12:36:10 -0700 (PDT)
Received: from tablet.my.domain (ip-37-248-155-75.multi.internet.cyfrowypolsat.pl. [37.248.155.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff888sm351179866b.159.2024.07.16.12.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 12:36:09 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH 0/6] ASoC: samsung: midas_wm1811: Separate compatible for
 tab3 + fixes
Date: Tue, 16 Jul 2024 21:36:04 +0200
Message-Id: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKTLlmYC/x3MQQ5AMBBA0as0szaJoVRcRSxKB7Og0iIScXeN5
 Vv8/0DkIByhVQ8EviSK3xIoUzAudpsZxSVDkRc6N1ThKs5GtKcTj4cdSiSjDdWsq5oaSNkeeJL
 7X3b9+36X96wRYgAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=ApQiReT7AHyvU+PXH8flb42ZYdHtJxbb3rfFODudKes=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmlsum3kF4Pm4o79jI+YcYbO0hN1d1CqncvmbcC
 lHI3zAEbQCJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZpbLpgAKCRCzu/ihE6BR
 aLHLD/9dfYYNfzeQ3FCt4/m2IsAJSoo/UNV1VtT6eBw5dLO4/hGjAnCMwXCG5ySHDwliwppcuLj
 nQBJscumzcTzbtuN9uFgbUzfwvfhPSsKaNr9RyWi5NrMgHjXBIJ0yJ7CEYiS64n1BK10UJgEejc
 AIbrWFmuEXh0V2rEiI7w4f6SzAh5I8Tgq6Fkfnq/ZNs/V9TXta7eKq1rvGGHsqds7koElupsmFb
 Vq+04+S7Ay0wIOXIBRoao9j+jkB2l4/ejV9pY9Ziernh9eRgj9ZpMmS0gw+dcj6DKWfrzQpcWzf
 y+vVUnr1/8o5VzVT/2iEa4Oe/ArVc7x44YNg9nRogirL8SGDpv6HrABHlRSt6zhQ6JJ6myYwjuY
 mK4SpF47llkHSFVAryApy9lOwLfVSq0K+9scXnXEC1xf9VtVbPE35NwfD1U1VVd/nvBAjDiIM/w
 u64BTQPuxhBLFqWU1GtDVbfyr3o3YG7+nR2/+DIoq/04GoVK6AnFuID7yZbMR9N0MtOj+olfMsz
 4/65BkoOYl3lpBt8cDGyjaIRAn4opkdRVKHMQF+xkcetvTgUB+W8j2IOAbHdM5/L/p3dWPyoghu
 r91ndF1wtYh+9rFDSMkrXdQ9gvVxUlUDUqOmRpWTooMEcnokncf+fX7w62lIlXyjiHfdccbdGrX
 k8jr8QxkkcsYi0A==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

This is a follow-up to "ASoC: samsung: midas-audio: Add GPIO-based
headset jack detection"[1]; it appears to have been silently merged
except for the DTS parts, this patchset is a resend of the DTS patches.

Besides the DTS changes necessary to enable headset jack detection
for the Samsung Galaxy Tab 3 8.0, it also adds a new compatible for
the Tab 3 (samsung,tab3-audio). This is done so that we can set up
different requirements in DT binding (Tab 3 does not have main/sub
bias regulators), and drop the main/sub mic bias dummy regulators
from the Tab 3 DTSI.

[1] https://lore.kernel.org/all/20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com/

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Artur Weber (6):
      ASoC: dt-bindings: midas-audio: Declare required properties for GPIO jack det
      ASoC: dt-bindings: midas-audio: Add separate compatible for tab3 audio
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec
      ARM: dts: samsung: exynos4212-tab3: Drop dummy mic bias regulators

 .../bindings/sound/samsung,midas-audio.yaml        | 59 +++++++++++++++++++---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi     | 39 ++++++++------
 2 files changed, 76 insertions(+), 22 deletions(-)
---
base-commit: 91e3b24eb7d297d9d99030800ed96944b8652eaf
change-id: 20240715-midas-audio-tab3-174716e45618

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

