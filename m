Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D04D7D55;
	Mon, 19 Oct 2026 10:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405439; cv=none; b=tYIoAe5XkK80SCyT+r3fdDDOhuwny40+emv6ErxW9n+OX5kgXGfkOaXRb14Qg6zTfD/nV6g3Jmsa6BDw7yu+ICPsnKcF5huDMPl++aE0po/tkROIwauUUETjQUc5iX5lCsIP7zd10Yu3WJAonZElDJAMAvk1qzJjsG2pLuonvbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405439; c=relaxed/simple;
	bh=fyHhi4P71uH3/LyPFglPqnG8fIGu3u4o0oWoEIZR58s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LT/H0un/9IP4421EwaxdRBMhxGKQfyUx5EACx319WHDI/D0tKhM4/YM3AurSTXJQhsRzBgqx5qfy7Kt03ThLOsI/DXC1dqD3utdyErdg+Lj1FCD8MGBVWHwP6e5eOnLXzs9h6RSicWtqSgJhBFgWJgriSy2Ezj5NHWKNT0szcpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7f3TpZF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7f3TpZF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D082C2BCF4;
	Mon, 19 Oct 2026 10:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792405439;
	bh=fyHhi4P71uH3/LyPFglPqnG8fIGu3u4o0oWoEIZR58s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T7f3TpZFSH3iAr9WChg+ASCXtM4Jp+/wRJn/IX7Wt6RUKn//jIqBx5EQvJuq37Avz
	 0b+89UGFiAi8gG2vVAaO4oxvi8gk0cQkgGFMp7OuJffdZD3DS4EQx50hgbu1Os9nOt
	 I4e31lqsOefLagYwINSqeX5zNnnbu+XsHUGnw1g3zB7QsZlsxlcEE4sAlu1h4IM19v
	 8TMP202FWKs8S9TTPgl+rzNvdtm/6EQSrnvtvdK9Xr5EA7r4KzZW9xgG8xW/X8RL9G
	 +liv+NpvV31bzMsyUtqtpuIampg/H++Uy/SohGgUkUhCF6MHlF2tf+ePNGr873u41Y
	 zYeKV2cm8dQQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA6DCCF2D3;
	Mon, 19 Oct 2026 10:23:58 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Mon, 19 Oct 2026 11:23:49 +0100
Subject: [PATCH v2 3/5] dt-bindings: arm: samsung: Add lucky7 board binding
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-for-next-lucky7-v2-3-c4ecab4b1c4c@member.fsf.org>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
In-Reply-To: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=7JvUn6Gsqc0cxhWub/oalXTSGokInna58PtxHScXffE=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1e+7u1fc6RiK79qTd3xcYvBPtWkFsc37Qiv6h
 VD3VsVE1uqJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatXvuxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+sy/w//ZekwG2PGvYhJbYmzUGgnKyuMJ70zcEn
 cD22liCLf0te67fVNfnhsbA1UcRmJW2zVGK06m+wW2BPs8jJAfya+AxGVeW18goOK8xz3SFGPyt
 QVLZjzcr36xWYhMIGcN40ptTMxO/6BRKVljGSTC/QuzbsmNwiGnMwWz/amIljM21fl2OOsWUnp0
 6SkFlafbMevjW556pAUE7n78H52qfHTSZCY39JaeZpoWzuOy57JSTy0g8QQOu5ugpDfLvRGWlbX
 Wu3pe8D4E8UA2piQkq1ppCeNOTsJyZMxD16Fy+adp3DoXBAjhnyyU4df8AhtLV7Ls1QLntb08nK
 RWwHywhL/SRPPuGB7vrqjB6YRmzSCMSL1kt6i5dshKvvYEV0oQ0qdTcQTi/0f0xgACv68gQaXm6
 qrBGSdqWNzKaGTsQeMOwniJoZrQ0kgNJhsVwEC7wmrvvYTiC8oLA31VrSwuFEBfJ2b9Tn3z0VOA
 Fs7XFOZb2dFFbWwD8+h0Pyyz3DH5ky5elpYQ7UwK8WK0C5nybCz94SAVo29m63nJDjV2mAyhO8Q
 0bbCW98XcDt1krkOZGWJVbOy2OLO53U2BSGHgiM/k1I/+8FAt0Ht+QX4y4V5lwTkIkmmcFIg9Dw
 eTOA2BTXC21Pt+Os/E0HIiKyR92TaoBh+eSuVX87hmD97VEltYLY=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

From: Aiden Isik <aidenisik@member.fsf.org>

Add device tree binding for the Samsung Galaxy Watch FE (SM-R861/SM-R866)
board, based on the Exynos5515 SoC.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index db19a686f490..c80fac4fad7a 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -157,6 +157,12 @@ properties:
           - const: samsung,exynos5420
           - const: samsung,exynos5
 
+      - description: Exynos5515 based boards
+        items:
+          - enum:
+              - samsung,lucky7                  # Samsung Galaxy Watch FE (SM-R861/SM-R866)
+          - const: samsung,exynos5515
+
       - description: Google Peach Pit Boards (Rev 6+)
         items:
           - const: google,pit-rev16

-- 
2.54.0


