Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA2148838
	for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jun 2025 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751188670; cv=none; b=neNVDJK+eMkAJteVkFwt4R+kgnQ8Yrhs8OkyndA+Ht5sAPJJ4b+PfOOlO+xoyqsAfDaXsxO89429tCpkFL4LwSW1/o+goidJEoXyu5mQAfwo0xwm4lrnbKqgnYKq5dHwam+m/G6qnWyj44L+fSGZnelaBUKb4eMc3LA+V/dDvc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751188670; c=relaxed/simple;
	bh=YER+iaqNbS8Uor6c/YZiV7uz8ZGTsgE0nESEYcW1cos=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ORPAmm3jsK9gZ4OEOs/0zSVWzZfSZ/lkvozsDyE92efgnA05IEG6+AYvFlk3YHkZ5ovEswmxmaS2AuMbir2E6bRIn9lDxsdiQhFtlyXdYfXfVzqEoxmzL91Eu0QT8F6Kn22tUtlVbzEnCcrAbly0rN9EOQ5QoycYdUgUqImKxo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjO0WlYT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjO0WlYT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2350fc2591dso30306235ad.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jun 2025 02:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751188667; x=1751793467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pqcRd2yr9slWTxBRPc3E4dnPOHab8OahlY63BTf5c7U=;
        b=UjO0WlYTjvcBk7D82pkXrl5j6amYwse67JHeGm5pxOXXiQowX/5PHb/uugpz0R1eu1
         dcRG9peOCK/lHKLqPdWlzuHyP0h/5aTaYnrEGxIjFgVR7q7OFL357ftdCKevy/SC1uoJ
         oP8fubYszOrzc43F9ihkjwQRklk7EXVa/ujqWz412V/9M4yGAzceSsTfir99XnfsYhWB
         zHMKMLhoJLTHxj4M2eEtXCcq+kaRedKzNwqkNeFhz6+3aZU0MI36KLv2hyN8rALqsdMB
         RaH91vTAMmeKSNTJaeDFSudiElhdkxwMxzPN9xMbrhuKcjyRTTfQOS23DwcFW5qiyKND
         kssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751188667; x=1751793467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqcRd2yr9slWTxBRPc3E4dnPOHab8OahlY63BTf5c7U=;
        b=u4U2xpm8GDyQO40Yf9DKYbWLnTKozHU8juEdDtcJ6E6wEHxOJ9EoR0S9Q8Yvlesog9
         3HKOqBH4rlRHPXQNsng0b+UYYmsN3ewnscHbI/sNT2kBQb1IsC+kUcF63BjYr4AtUZao
         4kbfFFYtb8A0atVn5+0YGaL33ALcYeTd9DSZ5lk9TNGRNjVxs4/gYM1Z6Z73imbluUKb
         vLlVu5JlfU4Q59yqNBf3DkmcutVhtK1USiwVWQ6GUXIStafMnbiXwzJ/umbzVN4Lxygw
         Dm1YfpZb2bYUGkm/1kNyhLdF4W7F8zJ+UdhFi0cuZbMuOEW+xPkkvk+UWHv6yOH+v+HR
         DFXA==
X-Forwarded-Encrypted: i=1; AJvYcCX4EJA6D5L3ZIRuATX+vKfZ5Foa40KsyyUve/Zq99GwBiy3/vKOpp86gvXD/VBl5OwEV3BBB5vhtUXr8IFtS4v+Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx536zACoP4H51yGKyramDId5C5S6Wgvjn7DN66dsMN970eDt7V
	Pyrwk3kqMgO0+OWf55XWfukSKDktrudVepFjrm8Y4Wd3XW0lCghSGQ5C
X-Gm-Gg: ASbGncvjLvQ4Co4O2Q/MHDYWgrD3TSiwaoIIIA4vd/dmWPe8IsNt18OUAoeksNf8jCC
	Kw/3VfaKPimC5k1jTLCODvusg3qQk39FwRgoHtKBAZ7zpba2a4pK50WeJoHvfk/0B9f5T+xp7xL
	sTUJN0bPpCQSaH93FKkMFtN6vcWHcS99RN4+fMygch4soEi0p0vctcBl+c9SMnNHz5ryxdhF0HV
	hfiA+ZOlx50kxZ1zBlD4R05ZmAAzv9bsU6bVOo0vMdkWAfIAReXS/2SaE3BHtQ4aVv6vbJ0TnZg
	gSMPtg1ONwvn+qh9JRuOSegU8cE/4y4u4ULTFbFbzfBjyhz/QpYbXUV3V28XKMsNjMlhNgiUepU
	ZB9sPdaH6LEIF0NgBKbAmCHVCc9+WWAk=
X-Google-Smtp-Source: AGHT+IH27CenTTY4wAk6ooOK5q7PIwusjv28QE/O2orPE0Z34Ie4F2XU6HSiwSX+o9sFVwVSvoypeA==
X-Received: by 2002:a17:903:3c6b:b0:237:f757:9ad8 with SMTP id d9443c01a7336-238e9e06b68mr203593385ad.1.1751188667350;
        Sun, 29 Jun 2025 02:17:47 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1c05sm56828035ad.16.2025.06.29.02.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 02:17:46 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] drm-misc-next-fixes
Date: Sun, 29 Jun 2025 18:17:42 +0900
Message-Id: <20250629091742.29956-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

    Just prevented pointer leakage in printk() of samsung-dsim.c module.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit fd03f82a026cc03cb8051a8c6487c99f96c9029f:

  drm/bridge: analogix_dp: Fix clk-disable removal (2025-05-28 16:53:31 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/samsung-dsim-fixes-for-v6.16-rc4

for you to fetch changes up to 2ab3ba39153dcdc9de7d2eec42bf19f84d4844cf:

  drm/bridge: samsung-dsim: Don't use %pK through printk (2025-06-29 18:05:51 +0900)

----------------------------------------------------------------
- Fixed raw pointer leakage and unsafe behavior in printk()
  . Switch from %pK to %p for pointer formatting, as %p is now safer
    and prevents issues like raw pointer leakage and acquiring sleeping
    locks in atomic contexts.

----------------------------------------------------------------
Thomas Weißschuh (1):
      drm/bridge: samsung-dsim: Don't use %pK through printk

 drivers/gpu/drm/bridge/samsung-dsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
