Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A29C23C8B5
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Feb 2025 15:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943809; cv=none; b=OBWOM+95YLzko7ly/ti1glEMGDkNhy58ofuzyaTNz7l+XnGvGJe0WvdiH71+lzpcoN5q1nMR0Ma5KiUWmGKbLjM4X5ENTPW3gtfeFUV4C5xwUtYYfXIMnEkjqsz/2VZwsmLjPLoTwiCprnNCuYbxadLAZsi+ztrRFGjDmSqnLJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943809; c=relaxed/simple;
	bh=6Pxx6KI65/1OvLcTbyXFy8HVl7tEE5dMXgqx/8YkiDE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T1QibQiGeesORjhkvxrshojmjBArTaA/HW3h2uZzAUHsk30wEg3CR/RQ6FBvnmSUWW6LTzEpXYuxn+NbGFVbxrybEVkFDZ85iv8iarBXoN4n2YvtrGEJs8bEK1B3JEcYfhEXdA+q155zNyrDNwSUO5pSdf2pjmh63Jp7S7fLTFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVoLb80r; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVoLb80r"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dcb7d6b69so373395f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Feb 2025 07:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943806; x=1739548606; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4XaH+BkrFcElpValwujf8MTwHDZlLF75VrF7xokMmE=;
        b=pVoLb80r+ls9z0veoWdNjDayLnHz3F/z4vcl7E/6K9XDtTS++3h4svqDCxYFHK7cIW
         Gww6GVrEKuF5WG/SMEl3ZdGCk7BCcGiZirHo+t7c3c3fglBW2NfuBM0+RaBqUm73kHeY
         kZIyLu77MtUryEQZphTuXf5ocQiBIXaVJ0vQnzQ8rSvl1WJSGuVq4X+zExVhEhE6oV6r
         sYbCjzV8HzlPNz+mOWE34TCJVCbAW0HWw0hduFfS8hNH9tp9reii0ijfMjMUcHKluOSJ
         dwqLPxv8fruslukLEkTlKTvlYrc8ZPkbhTw9/cqa32vBL59x1clwq1eZYkwATgUUwNt9
         /+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943806; x=1739548606;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4XaH+BkrFcElpValwujf8MTwHDZlLF75VrF7xokMmE=;
        b=UP+4flv9SHmuUOG2v4mg67nZewFARvTskHcwpobliMW1aHkRCmDCT0MZKVYbJ304YH
         Y901NtPqQntqwqoqnQMv8t2kvgZsQJwjgWvMPzqh/CzVYSVtBN6TUztnfNF2X/I/DfbO
         zTQ40o6iD/a5K1qVCnNXTlJKC7HHWNolUCwXAwc9u3s224khqiZ/ZmWIPKi2L80RHpCS
         CSzujkL/BX7Yhv9588igxQ4ePSkq20udOm+n6h3TKXAOztBSGfX5ioYcLzKIrsEO/0lY
         6xnqLFnR0j46Mlbz6dke81NLnWJ8sowK1v4uVw3MgKtPgEsYm3XPpW4WtjLVS6GQ3PIS
         PN2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfvfQj4WMp+LLcKHQ1iMVt0JkK0H9fLkhTch9unYNu2KxSRYJkcb8WxQjVmQ4zt4ol4bDcKgv+XW93PS35fcPY6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQXNJt9Brs+wvGodbm65iy06VpsyICD6Q7m4M7xOSzFG5GE9qp
	NrRFpnBqo5WqvZOCpzMm3/XU3JAl8B7CFd4qODEaIGqsM7Hu53x22mSc3aDg0rc=
X-Gm-Gg: ASbGncsLq6UgTjfGF3DoFmXWZsyD8WYEKm5sYcsT5SX6c2aVYcIQQZqyTCKvh60heeN
	tUeAWZwkH1OS7t4bTfbbKwLqAvYCWzwDWR6PZZJogl2iHFH9Xc/9UaMYhIjJBHXIGkUPC+QWFwZ
	eGuE5iowMJhhuDl5Ibx89IE46Jh2KZejJs0k97QprfiFOySRCsgkXsKTqQOrTmeDGrj1nqy3oWI
	F61YVQzjmxiCf0cUl+EYAHG4TcgfuAaIr2N4gy/MZZYus2yjfxVYnh3KjxpRUJ1/9Ck2MqDzx46
	rD2lY978Dk6fJnhg3Qi3H8t5lQ5UxHFGHR/j/KmY0GiHCCfa8Fc3Bmntf+JqIsjWFkTZJNY=
X-Google-Smtp-Source: AGHT+IF1isjfJhpwBwRn2wFIcqnriDpf7RWiylXJF2/fIw66GnlQdlas3grGew4e61BN8nzPIDi9jQ==
X-Received: by 2002:a05:6000:186d:b0:385:e1eb:a7af with SMTP id ffacd0b85a97d-38dc9491e85mr2957542f8f.48.1738943805838;
        Fri, 07 Feb 2025 07:56:45 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:45 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/4] arm64: exynos: gs101: add ACPM related nodes
Date: Fri, 07 Feb 2025 15:56:42 +0000
Message-Id: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADotpmcC/3XMywrCMBCF4Vcps3Ykt2bhyveQLkInpgOalKSES
 sm7G7t3+R843wHFZ/YFbsMB2VcunGIPcxlgXlwMHpl6gxLKSKUEhiKFRDevb6QNLc3kpbWjFg7
 6Z83+yfvpPabeC5ct5c/JV/1b/0lVo0BrFFlDzo0k7y+OLqdrygGm1toXB7I2fKsAAAA=
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=1810;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6Pxx6KI65/1OvLcTbyXFy8HVl7tEE5dMXgqx/8YkiDE=;
 b=Ir9PpklqrZfAtoVJ4ojwHmNFqBLoHsRgq7+0zLdvsefNa+gLYJx+ogCrjXkLGQONm2MnOkOCR
 Pdcub+4iX2yCB9rrP6hCk0igolpv9lrMS2AiWNEMmDCo/5o+wqcDM4a
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Define SRAM, mailbox and ACPM protocol in device tree.
Enable the mailbox and ACPM protocol in defconfig.

Bindings for google,gs101-acpm-ipc are proposed at:
Link: https://lore.kernel.org/linux-samsung-soc/20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org/T/#mb557ee342de628b1a8e462d4fb7c3ac6eb8be4e4

Changes in v4:
- rebase on top of v6.14-rc1.
- describe in the cover letter where are the ACPM bindings.
- Link to v3: https://lore.kernel.org/r/20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org

Changes in v3:
- ACPM: don't specify the channel ID and type in DT: the channel ID is
  discovered at runtime and the channel type is always DOORBELL for the
  ACPM interface.
- mbox: update #mbox-cells = <0>;
- rebase on top of v6.13-rc3
- Link to v2: https://lore.kernel.org/r/20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org

Changes in v2:
- update nodes based on the bindings updates
- update mailbox and power-management (mailbox client) nodes to specify
  channel type (doorbell or data) and channel ID.

v1:
Link: https://lore.kernel.org/linux-arm-kernel/20241205180200.203146-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (4):
      arm64: dts: exynos: gs101: add SRAM node
      arm64: dts: exynos: gs101: add AP to APM mailbox node
      arm64: dts: exynos: gs101: add ACPM protocol node
      arm64: defconfig: enable ACPM protocol and Exynos mailbox

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 25 +++++++++++++++++++++++++
 arch/arm64/configs/defconfig                 |  2 ++
 2 files changed, 27 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241220-gs101-acpm-dt-6dcde166530a

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

