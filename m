Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF637F314
	for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Sep 2026 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294425; cv=none; b=Zr3GV6x+pxXTdg+Qdc1oaSOcrCndXn0dyehFwJocBltDlt81oTZ+gqx+iho3xwJ1WXDCUof9KY5LV8Id3y+RoCVTiB9ghXbasAhwz5PF4ckCfoXpmlu0Rb2LjRjBix8jauYh4p1du+XrJzx28fjevQpJYv7v969fBXAn9km35Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294425; c=relaxed/simple;
	bh=c8fRolluBpzlmKYIPFO1LQAFbf99+jpwkEHb3QaledY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fRnpUhxqOehJevRLCRq/OzsGpIVXqrK939dfVNGpPnK31RivANCQzUlA8dAAS5uYbf2YATUbQAJt1ORcURhqbCM3b3tQweuJEBd52WsVVy0K0GW3vzZfSqHXMFbQuOQMlHVblmpiGMYvzoKZ3n7afR63T5XGB6m0Z3npKrJNGX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=xIjgYLl4; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="xIjgYLl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-2eefaa527c; t=1789294416;
 bh=X8oskerCed8wtBDGD8uooyhBJeVpFkgbAxTk0qH3hVM=;
 b=xIjgYLl4vzKnqcmpl7i32OBJgaZE4PFTyXODeOCxWQS69eHv13kxSSzbG9EjXY70dx/9y8TzN
 yY52haLgleUMJ3yXUWFKzILWWUV8CV7HmTqzgU7FW9fqbSRt1DrgOHw9XiHwnQQbI417o6/SmN4
 t+ZgVTdbVNki9jqmy8yf/lM=
X-Forward-Email-ID: 6aa6774f5d6bf3657bd82a22
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net,
	alexey.klimov@linaro.org
Subject: [PATCH 0/2] Add Samsung Galaxy A21s support
Date: Sun, 13 Sep 2026 11:13:29 +0100
Message-ID: <20260913101331.198835-1-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is a small patch series which adds support to the Samsung Galaxy
A21s. This device is part of the Exynos850 SoC and its device tree is
very loosely based on the e850-95 one.

Thomas Turner (2):
  dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s
    (SM-A217F)
  arm64: dts: exynos: Add initial support for Samsung Galaxy A21s
    (SM-A217F)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos850-a217f.dts | 193 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   2 +-
 4 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-a217f.dts

-- 
2.47.3

