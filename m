Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792454558;
	b=Rtc0Qvk0ZVUaLdWTooYQvs6E7PAG1uMUR1aRbBjVznPFSpZ1FIaydu+TI+kRoapCW8N0
	 8TeJ2lDWagFEokfh0BWfT6Ohf/U+Gi2ClQCQFO9XWqWMvWmSFOhOgpNWBifgukTekqRuL
	 qbsE2F5aQxY3+ykqOzIqE9iej+AfZm0gdjCqgNB2X1oDjaNXrUuGR53IbvTQLovbP1/1x
	 pHNmR+XdE7fHBaZOehFBPp2UixC2q/6+s11gHGU4MD6JYKsdc2d7buH9ARGEEzyxGdGQB
	 hA5pYilhmQ3s0buXVA7gDVxtEzEY5uUYds8HnTDjqf5L7ZpwOe1VrtXGLbdsVDdFyNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792454558;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4VGVxw703OxUtr56IczmXP66ou7VnTSuoj3yV9sgxC0=;
	b=CJzsDuXkTrvalaSh8yK23hEKsE5X2FMSUypJzRF+woVcUHpcyNT6so/RJXghCR01g0cP
	 PlZXHsKukIo5HB0EeMiOzwyWRLTKOq/Nnvc6s8FE6yG3KEy42Bkgb88TCUXbftaO3+glZ
	 /lkBZEoTgY++KKHYa9FArRFBgOZ86bqlh93q1X3vvQhhyDnBWB/6s156rfq8N8rS7lnds
	 oS/m9DtVD5LeQbBZ+iPedUVlUxItOauEWUOCwf8d9OSTQ2Ay7OjSRsCiPZjqSsXO5UrIY
	 Wp7vu9sYBsTj8JGLw/NbU1a07Euh5wHgsvZH++liVcSSvpCGYcshUYTLD/ZMCD75Eow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ld0XHEdt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48B8606A31A;
	Tue, 20 Oct 2026 00:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ld0XHEdt
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792454557;
	b=Kb50vLFjpiT5uC3t8aM7lpJkekhXvCeu6WFmeiKd2u6ZLI46rQOK54zOlLGbT3TVMPpQ
	 mupswpyeddAJishziN2od86TQqsgpejoLOUOmj/DH1MsgcL4jrMQI+YplIigZLIc0mW0k
	 b7I5sftm3TdYlPNwKGbqRNB3s1ELXfqON3Cx1+2y6mesP6v0zyshteDm4ebMDqvCQw90K
	 qJSO7xEyfoD50apV6Q9XON2YNHu7gYRc37cNFcdzIDgoFI63FRDB30536wE23bdgp7Vfi
	 WPniIdHtJ8TO1gpD1AAY01W9WyqNccxTdTKA5rlexhy3VkPTpf+8EdTr3yeTZUc9x8w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792454557;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4VGVxw703OxUtr56IczmXP66ou7VnTSuoj3yV9sgxC0=;
	b=0UV7fTf36uLRq9IzMM5haxlhn4FXogLqHKog58MU6gS5Ca4+PB1osMQoCG9oJwun0NF/
	 ysOcHW9Zn2XPWXq2e4JaMKtNpPSVntcSnOYu+VuHzblvUzLFX0r3TZ9+QD2kNJyK+XGqf
	 SSDvmSawpwkq2EguScQ8C/E3BmKLZJNCPRVY1PcvwacIoP3TwQEjSMHlU/2b1XncMGl9i
	 aT8RVozFDbd2NSkqzeHSPDtYX5hsl7f5TUxelgseXLXLoh2S9WaLXacJPOYO2ZvqY/pzF
	 WWzMXdPCwC+ToDQzn35RFcNNYuAEkebTVgEcfEGF5ZboPwOhZwpZiLJvv8hSvpP0eKg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D50C21F000C5;
	Tue, 20 Oct 2026 00:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792454557;
	bh=4VGVxw703OxUtr56IczmXP66ou7VnTSuoj3yV9sgxC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ld0XHEdtbg+hh2JS/Fx6OukGfBOz5J49FHCKoK0UkXj9ZbMqSVCMT6or/D7owwE/2
	 Xx98JkxkndrMw4Yi1F1xvcJY5JIOIi8Ffr/gKY74u/hyxgCnk6YMzLbJquyUUTNSuK
	 l9RdZErsKJHgleAh3FmvfvFrRvlIY1rW0FZ/t21B+hbh+VYN/IVpMToEo9ZADwdKXX
	 xirgWdrLrXFsHZvwoXKBdYdPs3kJVnfBLLWn61D1mZO3Vhogm+XdaZxTd7D+nb30YF
	 N32DPu1yUGgMqXWI8Vyuwtxe4piQQD0JzRVzueqtiF+IPEJMyXuMkRz23ChgeV2iTd
	 OwQVqyEBUWv4Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 66E33406BF;
	Tue, 20 Oct 2026 00:02:36 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Tue, 20 Oct 2026 01:02:34 +0100
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: samsung: Add compatible for
 Exynos5515
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261020-for-next-lucky7-pinctrl-v2-1-b6b0e6065452@member.fsf.org>
References: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
In-Reply-To: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=844;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=wcMJv5MC9TAqtq4PfS0HwwKmDAbPXKFvyCt4uDAd3gs=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1q+a/w4FRcf5pIs6c0cfBlyB/dkjDSTQKmwiM
 TH8zZvr+s+JAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatavmhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+vJGw//b0cu6ODcpEuJLNZgfef0aE1babIjbA2
 PLLn5RMb0w8dtLuW/BXzn1eLl8yfNCVvGuXkl9O56eRxLEt7+2hiLHMkOmUBLWRbxeYesE687MS
 PerJIGgpMQcnfjLrTxH1ik2BHicO2QryifsnkWGRWT/a4SA2R8oE4Z/eGh1GQ9AJOnhh/HxvAOv
 LpH0KvpWWeIxNghc88VzyKrLFwVRzivd3GJJM/2946pP7tmKB3stxI7eD0B9Kp6wfL5yTuexGin
 JmOChISUzhDx85MA7e+QOSTygsi7grPY2Cpmngw1w4Xw846PDl4HVVjizOvVzgXacN3Zd2Sa1pv
 iWcas2zRh/+JUYttInvWY9SUCwiW9ewShYRz0zd/uTfbt2Jd7G4/kyWPZxCDyD7KDSTYjPJKQ8L
 PqkC/XwIu89vOGzkWKFCKxsNCyMABxFdjXH2zuyEfoSxx1tHPn9oAilLhpes16PDYPoXYSg/2n6
 6eNNSdgMzkmd79lmOVL8+X4bGQE35lLi+n9pITRP0JCdypGpOBoa74Tb+6SGsdqohnvn1rkWLvL
 IvoUdukep641ZypoYYnhg2s2ebYreGn4Ebec8kXxbPSenulFZ4lmDGL7Jo/2P+v1WAsXxqJxNjM
 uRW6gzWNoBkc00wm7+f1UM0UWDiwDegecHimvHpTGggqN1u57CPQ=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org
Content-Transfer-Encoding: 7bit

From: Aiden Isik <aidenisik@member.fsf.org>

Document the Exynos5515 pinctrl compatible string.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 1feb6a6fc690..7e49ca7b560a 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -49,6 +49,7 @@ properties:
       - samsung,exynos5410-pinctrl
       - samsung,exynos5420-pinctrl
       - samsung,exynos5433-pinctrl
+      - samsung,exynos5515-pinctrl
       - samsung,exynos7-pinctrl
       - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl

-- 
2.54.0


