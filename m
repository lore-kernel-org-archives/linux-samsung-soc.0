Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220398;
	b=jMXF6YIY94Y5ExZjFsezB3e6R/6ksm1ffk0urg9wYuZM6SC+UfApikLyRl7u34O6+CFA
	 krfKCXlc3HD4CaY+AuMbd6yaktjWsfOSRF/RnoW46tc+958mgpXlSCIFhcOCdXJVkQMfF
	 9mEuH+XzJlSLrPuYIp4GOlhPDJtiv11D/MbTG+/klqeGFWFRqU0pWyyloSVPnKpbZTvKp
	 YdlGYUdnyHpdj8TYyJekhQwJ0glnkCKEi8tYFKG0jsg2ftM3tKMPXWnfIXUNLa8lh5P9i
	 OP8AN9v0bgUMI32h7byauoO/aYbiiq11/3mVXsqScVIKPBTDwK2XMbbks/Xp/JygTKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QfIpduHoe8eeZDLf/6O89XnVTMfwvHnF7GrEmwVWOqo=;
	b=kNnfasdJ5gyxo2x2hqaCgAQLIc5aLi+z80rb5z+iaEdQZjrc9dZnSUOz3IMXGqvR0cSQ
	 t249SpSEMkJlT3AenyfxNvTvSzGM/hS4rOKHD1VclYDZywrbxCe+061wPTU/Pm7JBYoVO
	 vWbrYjXcpNSvT9z3yup4rN8HyI+fN5YqL2Z74Imb2/hOFFvD75HaiDExS7K/Eg6Use2qg
	 sc2Vxsyogw+X7ZrGw4Zx3Mr9yQsrsD+tiVbyfIrJp5IqMJoFvZtctWhqZzzG803gSWmuk
	 8hmhiZ9xr6k3hfz/HsXX9Zcg8XDqZI820l/M6+/8q/+TIRZffLv+lkr978VECjMB9rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=samsung.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGNwGiO0;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EAA606A31C
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2026 10:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7EAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGNwGiO0
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1454851eec.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Nov 2026 02:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794220397; x=1794825197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QfIpduHoe8eeZDLf/6O89XnVTMfwvHnF7GrEmwVWOqo=;
        b=GGNwGiO025HhEZpDhCIfI7f9L5AhfrCjErReDxEkk7qQZrY99QyQ3Krh8ykVvtuua7
         GYcKsYcRIbFKLtSpT/Vh+X//f65N3P94hanAKtMMX9Z+YT+rOVUYqMQkorXnkjgmzCfv
         PST5yGM/uw00Jk7hrtT+bqC5s22vAAgLuUpM+G1IeVNdWuaoBQBCrAp5csodfBcaFlCd
         Yke5+sXu+h26QX8CMpNG0yQLAXwz6fxqWqF8XoP4PEeWl0kfEcq062Wg6xnLXT27qSyA
         6IYCRzlhLEqY94Ery3StbHka9QtF5QotlfZjLtjunr8DaZ8mstYEvLWozxP4hI2amk7C
         CMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220397; x=1794825197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfIpduHoe8eeZDLf/6O89XnVTMfwvHnF7GrEmwVWOqo=;
        b=l/7EXJEDVvFXAbSlQXnZWOtammpEN6iUxHAbXytKjL2J9YwHIMRa8krsIrgAlnbGIb
         29bOTFr1VYrs77ha1T3ZTRVC7jDIRdr6Yf3wF+QCr/A+52jOSTbedSan8lncYok2blBp
         wTMjZ3wdlYkWMfhZSSKrLeRY2RZU0TZWVRvh+E1vOifzCPNNIdsJkZfb8IEacJKlN85j
         52/kP7g/2gUJEJpNfmjwHVXr1DYim/9Jj+1RTc4O9vlWC/7N7X5trQRR149d9NRgTOuv
         da++yC7C44oSLUSfxKYHlCiEIWpurtqu/R5kKkXE8LAybyG1BDBKQ4y54+h9Pz0/nDRf
         a28A==
X-Forwarded-Encrypted: i=1; AL+hErH29nwcYbwDpmsXS/UTXtioj9qHxEf8yfIKUJyUmu3I/jHplFJ4ELk1MI3MRV8+5mB22HtsuyqLfPNdUGp+jv6/OA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+9eS9P/HW/54a/qBbNxp2fXBSOf416/VBuRddvUd8V/tSv3WQm
	YlBj4V5F+SaDGQ8NBSs6hMIVjevjR2hcOtKSmrbV8EUoE1bi75G5edzrCSbfVtd7PDc=
X-Gm-Gg: AYBFou12FdOo8aeK0vGHzdjHplZjCOkYXd0b97Fdn3JNwRDsO29fu6ish/cMD8NEe4o
	4Ivq0Q0Wci7KYTuS0wGuweUS/+QFtjOwkgi4jVlVezzaJVY9i6t2bhUXDZ6Xooj2W/tV1OBtmgw
	kbFCJEbL6v+Ue8sLOBZ7IVKAf5jaLRdyvIgnFl76fNJB14dpCq7b28G8vRvdnVxtQt+dtiYucMZ
	jJ/1XfSsRFLt9WT/wjcrUmdH/y87Vk0jSpRqoUBDkuJqT72jUrviKj0h69v3QwfoX1Y2ZL9f35u
	jjde/q19+UPm4LvqAeJ4CxjdS+Gk4HITbaQaTa0nh48zMM0+Ct7JYEHRlR2Wxzxamy+7mYG7Va8
	CbIV8kVZQQan8jpA8/56Og4Ddv8R8zmifpZG20A+6/gXRVZ1K1uqW/1qpJlxUkHPsYf8bwg2qUL
	9EttNPwP3OlvaHKtAW7uZL3TAeNM9DCu9tPkj1uJIW8TcYndxdTaA+uICQCUkkv+MrI71p+7mlb
	MhNZwE+eNDS9+XqgaVX08Wjc3W1iXY9yS5fLONQ+L7v1Pchg+Kksiaw1txsmfrI/xxvuXUqza/7
	SpnI+xLomskhvqBYbEjZKh2YMjXaon6eWiUjfUWVmvT51GlBmFGtmbtPtbVSAwCxAD/2JyDaDre
	GMeodysgDt33031+o/YRYPrzqfOAb
X-Received: by 2002:a05:7300:10a:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-37256bf1a40mr7451845eec.16.1794220396780;
        Mon, 09 Nov 2026 02:33:16 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372656187f8sm11267999eec.5.2026.11.09.02.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:33:16 -0800 (PST)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date: Mon,  9 Nov 2026 19:33:12 +0900
Message-Id: <20261109103312.7235-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

   This pull request handles FIMD DP clock runtime resume failures and fixes
   a scaler runtime PM reference leak. It also fixes HDMI EDID and DPI panel
   node reference leaks.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 19e67d977d3d4d0c54f03906ef578578190db9e1:

  Merge tag 'amd-drm-fixes-7.4-2026-11-05' of https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes (2026-11-06 10:43:59 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v7.4-rc3

for you to fetch changes up to 869fdc8ba846ee6fec452cc34cf104f9f7142113:

  drm/exynos: dpi: fix panel node reference leak (2026-11-09 15:09:05 +0900)

----------------------------------------------------------------
Fixups
- Handle runtime resume failures before enabling the FIMD DP clock.
- Free the EDID when the HDMI connector update fails.
- Release the scaler runtime PM reference when reset fails.
- Release panel node references after lookup and on DPI parse errors.

----------------------------------------------------------------
Avi Weiss (1):
      drm/exynos: hdmi: free EDID on connector update failure

Jiale Yao (1):
      drm/exynos: fimd: handle runtime resume failure for DP clock

Wentao Liang (1):
      drm/exynos: dpi: fix panel node reference leak

Xiangwu Lai (1):
      drm/exynos: scaler: Fix runtime PM reference leak in scaler_commit

 drivers/gpu/drm/exynos/exynos_drm_dpi.c    |  7 ++++++-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 10 ++++++++--
 drivers/gpu/drm/exynos/exynos_drm_scaler.c |  4 +++-
 drivers/gpu/drm/exynos/exynos_hdmi.c       |  4 +++-
 4 files changed, 20 insertions(+), 5 deletions(-)
