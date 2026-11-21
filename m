Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795249470;
	b=quSC9hIe0gR54zZ+9kE0kayya3yuaODI6/fMBUPleUo8hDo/sX+XuyLbrmmR5UrVOdCT
	 BZHuvmJqZnuppJCSrDIXZJvF+GijI9BPWEq0lrRWUidyRyOsmQQyd/SwuxN5rkigGz+/e
	 cJ00SSHKRsfDVZLneSmjN4d2XIa2LZ41jVZNLIPDrexOPpabcI+uZVOx3+WuXmwHyYRsP
	 XpGzkJxWT3CL0eEbPe/L0HuIZj6/madbGBqR0mYLPzkb4T7QNF7VbkGns0bGTvbjZO2Uv
	 ojPaZKRkso46IVV8GhpH2XzpuQTMfrslmbIiimmu0ynMNmCYCZUHKPcQMkrH/VRLqXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795249470;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
	b=HY3Y7elbDxlrxWyspNAlmiBIzSvZ/VaqdDC0NLf2APQgqmPba4v9uaMWdIL2BOFYTnq7
	 QCQWZi0PJojVfjWT525PTF7cGKfjD/41PJ5zOtsN+qitIUG8VjOZMUjBUy4dbIggxuww0
	 v+8GJhO/9yHDDfTnqaqQS4ypXrzf8JYVgsA4t0Wo7xC6V6/wtkzJRHOpsziAS0cmRi9oc
	 LQoZ5DL8+CvlNWhc1BAPpOFw25dX6aEUhvXeMk+9ZQ0aNHYEcVwEWvdb6WwissD9ZoYC8
	 b76Jc+8TFqYZCLJG6MDKs7IFHPPCzgOvGdcf0+wPUecaig0bVnxus5YiyDNr6fdpDNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ommer.net;
	spf=fail smtp.mailfrom=ommer.net;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=rIpl9TiF;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=8pNMaZuV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.50
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42C6606A325;
	Sat, 21 Nov 2026 08:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42C6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ommer.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ommer.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=rIpl9TiF;
	dkim=pass header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=8pNMaZuV
ARC-Seal: i=1; a=rsa-sha256; t=1795249462; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lnmvB0B7fgfkpoLwn9qfXt30ZhFgxdVccwW7jlmLgpQe27YG5YaI8nwSbtsmLrIqLa
    LC5MYP5Z3tJxAZywSWklVG6b/G+CVPcbcF4zI3T9laJxOU/AcFjcK07gNNodBgPEoTl5
    6S4gnilBE83Ols9RpZmQ4TQ6IvUs5JBSPqgFnZiLDWNkLIQAjLUCjkSaiaaw2DplCT2r
    EDUpuP/gUF6dVzc9Cb+OPIw7RojnjOtZMlhkevZyhtd2NY6hYv4k6eBoe+BgsDlB7t+0
    imkSw1HL/+e6gBXYmjdPbipZLrRH9oJTruQ+GhzSPit2+wCkJXMhf3a5m3nKb94tws4X
    ufYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795249462;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
    b=pYZm6J14kuRzqZQkfQCYuStkt65WLbUcNRHRE1cAvQtK1S/w3dxAhQ4owZKq9UF2j8
    TecYBSrjHBe8FT6o8OY9OP/jPw9xZa/KSK2Gh1MgIZBLAUulFixIwN6icZ+G7DtFEnFb
    TwYDkMXnfBPUHE98KSdoQtgTIBeetaT0ifjZRkBg6hPNK8kfRXiK3a7In4ZyxYNU0dks
    cZDtp5fUeXy7VtgIubJ4033fp0iqKNC/GmYveNjV3qSuRrVfiyLy/PXrdSJnw/DKkexX
    2XJYQVBm5eDt+NKQMOUa83KFQaPjnq/LoxYhRkuuZ/wbqw+Yp1c8LyQ5/h4UZVhl/L5R
    WdcQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795249462;
    s=strato-dkim-0002; d=ommer.net;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
    b=rIpl9TiFblImfUPWqsGpMBxyRT6J2hiyEf4OkhyXBoF2ts5w14Ui1P5W1ZcEOELAq/
    k+K0qYw2QOxccJmkQBX/3fSAq2wP0CwYEksFrgEfbtcA8x7oOPF5u1dQkytoKM95zPn3
    eejkxRMwae5tZYFNuEUqaZ33iDk2im8Vf9NJr08et4cvtLavKsbwEXBGQ6iqfqf3jjsZ
    RRA92hkzIzbwiMB23XyMFAz2o1ZU/51+ViHhW8y6fk8AhE9UQkHHOCO3ReVai3rkOdKK
    VgEwkDjtE60Ntvi8Bri2rFCjaDGJyVY1N1xxcM4uzASvccbjdGmT0Mw8CJyxJCfKaUNP
    H6Jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795249462;
    s=strato-dkim-0003; d=ommer.net;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
    b=8pNMaZuV7u4xeNvSYV/+WozftHLDhsUVyYKSzLMGavdDFa3S2KDKk/dj6cBDw8zJ2o
    RToxYz770szmfmTdj7AA==
X-RZG-AUTH: ":JGkKZ0mIdPJLfj3rk5MOrv6kH/tvwFubxUqMvsWOyVXJkOABZnPqvKUstHY8FQgi4y8Fiu3j5HL2zuVyTQ9NDYXzNSFFaQ=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id n2f42d2AL8OLV5B
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 21 Nov 2026 09:24:21 +0100 (CET)
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
Subject: [PATCH 1/2] dt-bindings: arm: samsung: samsung-boards: Add bindings for a20e/SM-A202F
Date: Sat, 21 Nov 2026 09:24:03 +0100
Message-ID: <20261121082404.24864-2-henri@ommer.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121082404.24864-1-henri@ommer.net>
References: <20261121082404.24864-1-henri@ommer.net>
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

Adds devicetree bindings for the Samsung Galaxy A20e (SM-A202F)

Signed-off-by: Henri Ommer <henri@ommer.net>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 6f3e02a63..49e9cfaca 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -227,6 +227,7 @@ properties:
       - description: Exynos7885 based boards
         items:
           - enum:
+              - samsung,a20e                    # Samsung Galaxy A20e (2019)
               - samsung,gta3xllte               # Samsung Galaxy Tab A 10.1 (2019, 4G)
               - samsung,jackpotlte              # Samsung Galaxy A8 (2018)
           - const: samsung,exynos7885
-- 
2.56.0

