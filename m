Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EAC3ADB99;
	Mon, 15 Jun 2026 20:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555220; cv=none; b=UvE4J8f0fGClRT/HHxpkvpaEFcBjb2WfG2GH4OcAOd9sNBm86GsfELBzh+k+NX6WniJW+2+89oGxlv0AI15K7KjEjQhiGV4289d27f3S8TWblBDCq+6qFpRbUIeLA9dy8iGtVdLvsoI5AUmDlAVVZKRoVC9AZb+oRpkU481fVOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555220; c=relaxed/simple;
	bh=ugjC0qYGCF0XOrzbJirwAKm6BcrES8QbVatGjL7h/ek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YiNmocvjIHd6Ya2voFk42aUU623NzUBSeIOz5iRO39dyFGHl74pkQG2O6ovwkSqB8kEGOHorCdlIenWXqVfwMa4PhuY6ZtUbKSRXFrZ15vSMRs1J5/kZqutBobZLaUdk5/1sVeHI/iTUBud/9AhFBsj2M+9GedYfyO2MMOJY5Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=USoM+D61; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="USoM+D61"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7347026E0B;
	Mon, 15 Jun 2026 22:26:55 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnxHV0sjQoxe; Mon, 15 Jun 2026 22:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781555214; bh=ugjC0qYGCF0XOrzbJirwAKm6BcrES8QbVatGjL7h/ek=;
	h=From:Subject:Date:To:Cc;
	b=USoM+D61LQ/5jq6m3MqeBKGP8/BDUslgPX2IPr1dCFErR5KzW0owYb8pklq3BsQXe
	 Pce1EHEwkQkZI6yUkv04K6QfuQ9CGTxJjOCPHvWnqk5EhM+zHE2ACebadrM1CgWhP+
	 cNIXqqwVWO8c7TxgWeC3ERVPi2RH20Bu0KzX+nUnrym84/pu5jHzi4EB7kDUFIX5IU
	 oBm90L6RVKeUbNOQrxpnOf7/uuPONcps+vb7ucBB1qGJveVTSreHfBpEOkpmGgIIL/
	 TTy5Bm81Gw3gWzn+7+3xe/VaQd7nR2GGCyvzWm/a3y4nSdLfFDu7fQnJXiKn4L1tGW
	 7G3KJXEcEiSyg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/3] Additional fixes for "Support for Samsung S2MU005 PMIC
 and its sub-devices"
Date: Tue, 16 Jun 2026 01:56:42 +0530
Message-Id: <20260616-s2mu005-pmic-supplement-v1-0-41e84518b711@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAJgMGoC/yXMQQqDMBBA0avIrDsQAw2mVyld6DjqiElDxpSCe
 Pem7fIt/j9AOQsr3JoDMr9E5Rkr2ksDtPRxZpSxGqyxzrjWodpQjLliCkKoJaWNA8cdOzsST95
 76nqodco8yft3vj/+1jKsTPt3B+f5AXv0q1V7AAAA
X-Change-ID: 20260616-s2mu005-pmic-supplement-82dcef999c8a
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>

This series is a result of discussions from [1] and comments spawned
under it. When this was being discussed, a thread from v6, the v7 was
already posted in the list. The fixes were scheduled for v8, but the
concerned patches were already merged.

And unfortunately, I as per my plans was out-of-office for vacation, so
I couldn't follow up immediately. Sorry for that.

I understand that as the kernel is nearing the v7.1 release, and its
following merge window for v7.2-rc1, the maintainers would be busier
than usual. Apologies again for disrupting any normal procedures. But if
it makes to v7.2-rc1, along with the original series, that would be
nice.

This series has two distinct fixes: (a) to reorder the properties, and
(b) to remove the compatible node. The latter needs driver intervention,
thus this is also posted to the LED maintainers (Lee, ... et al?)

So, the following patches can independently go through different trees:
(a) patch #1, goes through devicetree tree
(b) patch #2 and #3, go through leds tree

[1] https://lore.kernel.org/all/20260515-justly-recite-6028f4bfb24a@spud

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (3):
      dt-bindings: mfd: s2mu005-pmic: reorder reg and interrupts properties
      dt-bindings: mfd: s2mu005-pmic: drop compatible property for multi-led node
      leds: rgb: s2m: use multi-led node of mfd as source node

 .../bindings/mfd/samsung,s2mu005-pmic.yaml         | 25 ++++++++--------------
 drivers/leds/rgb/leds-s2m-rgb.c                    | 13 ++++++-----
 2 files changed, 15 insertions(+), 23 deletions(-)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260616-s2mu005-pmic-supplement-82dcef999c8a

Best regards,
--  
Kaustabh Chakraborty <kauschluss@disroot.org>

