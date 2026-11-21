Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795249469;
	b=oJOwutZraVVMtogGPmNXGFV++zRyGUKamsQCMHFHjDrR8UFVnA2hDPAkF4kxKNF4E4ae
	 mPa0f4O9krGGdGKLX7sGufeulmFxPv1reoMI1RXT1yWbhAWJyX7NW0QIFKe/Bc1Ls7zZl
	 f7ygfOM4roNtwjxnY1YRb8GrMu+3LxrMP/qZ4RbzSdsMxcvI2nk6UBaR9bAP1eqB3Oxkz
	 VEEFN3SbQgPoT+98WgU2laMXrmiUAmTKU3uiSH1ZV+1cBS1DJkfDSNDzfxMnwjUR36mV3
	 ckPjn9giqmV60fOsEsnVemPfcIawLfTzXRQLNqTDJIpX73u/qmmiP5XQ54naOkii+xA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795249469;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=EIZIrUh5piCY5yNTOAXj6/6dGogGhw2YSeRm45ufSRM=;
	b=ooVPMLiSMxZ47CJy8U+0wy7zU1a6CtqFg7+OzpkEV/IKbkbPsaWbD/rUyJZgXSBuGshZ
	 OP1tbW86gaoI/s6eOZgSLxzaJtlm41A49api3FDyGCKcnCX28zmtLwi+X84SzgAToLKbe
	 OSFzAX7zJpa4D1cQl7yPsth2Hgj8iOmFoQCmt4/3rQD0V/2/FGP/Y37GHFG4cS+NwqKe3
	 lkFr+Uggk119ipeB8+PKyn1ZFUguY2QsIjQmVdQyHNvCbksXgQTuQLg/hneqkv1zz22Js
	 i52YVcgsjaQE1W6x1PQyJ3K0dOX/yxF7Hbnu1vpoSbR08cOY5QelOAfwsilWyT+tsoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ommer.net;
	spf=fail smtp.mailfrom=ommer.net;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=FHxxy+w3;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b="wBej/f69";
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429B8606A320;
	Sat, 21 Nov 2026 08:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 429B8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ommer.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ommer.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=FHxxy+w3;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=wBej/f69
ARC-Seal: i=1; a=rsa-sha256; t=1795249459; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=b9KSdTWqkGfFZR6jPt9UOvEqd/aOMIofLcBAvzUaq4VUX8sbadtoaXGUwCF16FUAfg
    RYBipf5SD7HYHBaBbMspv+Yhi4f7zwiaR/S0FzNTzsbFi50MLY+uVRpuqLKmzgSOB5QX
    BZwP3NEMqsci22iTUDyiJZibqdHTlya04tRgsup7cghkk3/nu1/zElj+qfCzJwzBTi/5
    jQwfFSfpErKjv415HeN/zTZbDFajreoJLM8zfUv2o/IlwzRQaxE3cYi3dEi7JaKxEPPR
    4xKISpsGVufmVwHhQOAev/ge9Vb7T2EOvZmtwWqCNdVKwkQQ5G+HY82bt3gpKDFcHG6i
    hUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795249459;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=EIZIrUh5piCY5yNTOAXj6/6dGogGhw2YSeRm45ufSRM=;
    b=HJEssbgq0c+MXMf/XhzMCdzF94VSbT8LsPv7h2dEu1e3Q4m3/sf+Mg5xlFEiQ1dKvJ
    9rVhiMemvPGBvRsNIIBKSG4rlLkE6DlBXVXGBqPhq4AsWyjfZ51zFLodtZVeBjOEDbhQ
    1rSyW7v5zoih8U04vnNS+3cM7p78Nlh/bGqMFEcQGosttwxvQYmseXgi0qKNN2GRHj7O
    sHvy4PnQTsoSSpWHlx4jfz5QuMbeGNyG7D/zcgzskErtUERkhbayjywNvwTE6plYLlFK
    f3QPZ850swNc/JRI9Z1Go/Dk5zJ8Fb7MLMuM+mh1AA/PiiFdjdaQ49Nkv21tuhrs8P57
    RYDA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795249459;
    s=strato-dkim-0002; d=ommer.net;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=EIZIrUh5piCY5yNTOAXj6/6dGogGhw2YSeRm45ufSRM=;
    b=FHxxy+w3z6dhqc0UtInhEfkzoxNU/Q5Zpd6JnHD7NZ1MGwmwD8NkyFrwDGGloKEpzH
    fMrTYk1XQj403aAc1ZaKYTzPxvgnlUAHYlr1w4fWcG8+Jogs4N45aG8C857yx4xjb3Iu
    4nhPQDJohulmPR7I6qILJyqU/JzG7EMbVtTcBi0o1422x0BJhugepEAL3Mw9E+coIB3z
    eEPgxyvjCTUR4T/7JWGUr8z23HIhte9rFTzLg6zQZm+qRJlOw0ZjIPGxoSRfUNC2vn6R
    X/Eo6YRX6CvEEB+RL+/9uDeSdmgJv7a8ROpZ23hxoDPZPqjJJ+eg50oyCb9hyWEiU09A
    nFJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795249459;
    s=strato-dkim-0003; d=ommer.net;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=EIZIrUh5piCY5yNTOAXj6/6dGogGhw2YSeRm45ufSRM=;
    b=wBej/f69MuwqR2NghqrUf2b4ouH6FckwbUoG4yV6CRiFhShHmSzA86qyX0Twfn1kEV
    grL+gkLDGo0E+O8c27Bw==
X-RZG-AUTH: ":JGkKZ0mIdPJLfj3rk5MOrv6kH/tvwFubxUqMvsWOyVXJkOABZnPqvKUstHY8FQgi4y8Fiu3j5HL2zuVyTQ9NDYXzNSFFaQ=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id n2f42d2AL8OJV57
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 21 Nov 2026 09:24:19 +0100 (CET)
From: Henri Ommer <henri@ommer.net>
To: krzk+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henri Ommer <henri@ommer.net>
Subject: [PATCH 0/2] Add Samsung Galaxy A20e support
Date: Sat, 21 Nov 2026 09:24:02 +0100
Message-ID: <20261121082404.24864-1-henri@ommer.net>
X-Mailer: git-send-email 2.56.0
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
Content-Type: text/plain; charset="us-ascii"

Hi everyone,

This patch series adds a device tree and a dt-binding for the Samsung Galaxy A20e.

I verified the device boots into a LightDM login.
The device tree was tested with the device tree style checker script, which resulted in no warnings.

Signed-off-by: Henri Ommer <henri@ommer.net>

Henri Ommer (2):
  dt-bindings: arm: samsung: samsung-boards: Add bindings for
    a20e/SM-A202F
  arm64: exynos: Add support for Samsung Galaxy A20e

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos7885-a20e.dts | 132 ++++++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-a20e.dts

-- 
2.56.0

