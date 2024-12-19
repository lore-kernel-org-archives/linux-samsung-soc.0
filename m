Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA3239FCE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2024 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734613676; cv=none; b=JyezFiL01R6N5K3uHYiV0IMjTpAp2ltJ4NDcrZS0TMFX6Em5D30cyRdEGTsnrJ1hMjzQPEQBGpId8RLCcsA8PzEYZMEB6OBbJ1UqYxj0aujI55lkdoCPhPIs1S881K/U6fYaX+RjPkU3QJuxWvVJ7N6DXlp1y3+NUmMS95EplOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734613676; c=relaxed/simple;
	bh=1yf/YbX5zzLVOPLgM9Mf3iD1fLxwVX2uCkX7LRhP57Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXc4+0IqkSBl9Ug39zy3dyQIhdtJ1VD5Kb+H4dUbEpTl4lc0/hMmWwmKCNe3RaumGHZomghQqosdH/zd/h3JSyG1L8VNcQdCQTl7QZAij/pd5DDevbCB0KcPHxkKG8VeQkD0tpIPJ3EFbQVzMRIZcTykb/xljzI5H3B9IGh+QX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IG1GgAY6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IG1GgAY6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so513728f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2024 05:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734613673; x=1735218473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmXfi4pLydKjD6u763/ay56dg5zTGdHbtmPA5MycJws=;
        b=IG1GgAY624pKivmCJPKy/QzbDsgBkHKtsX1/UeAdJUK0WCfC/pf6KYfwm9k/cTkEng
         sqaU0xhoXiHCl5SzdFPxNqHPjAjSPR9gScWSbMH8vCPVU7fqdZpk+Y1Q6Pv/YC4T/yav
         VU0M6fXOai3EKhcr2O4O3/Zn0hpV7sK7eocD1CA5We3zNqrD/BimXluWvIvBv/bW/x+d
         9Bs1UjrOAIzffu6h969E65UbIUeaH8D3boxai7ZL54+8m0H9uv4ibfaUIA9W7lmRHebq
         GD+DvCTZeJNeByj7sCcYGxeBT4IlCP4sPefHtIe1L4VRau7lxBxgapweZB7VtMCmskZl
         2c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734613673; x=1735218473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmXfi4pLydKjD6u763/ay56dg5zTGdHbtmPA5MycJws=;
        b=W1vtG2+4cENt0kLXr2vkvph62l3ywezLYcMFns7DmP9y7MQDt/4jbwjr56BumK0pKC
         13+4hNYZD7WunoFs9mJjrwYXUDTsHEKPUpq7wxpARcgqXVot/rbFwZJx/a/e7jhs+Aqh
         26waYkab4jTewkIVgSkift9DjM0P1/CGMRMyg6P9RrgGa7qnVB2WKR+/nQGbQ5cttpMx
         Kde2bpM/dzZGOT3pkZosblINd1YJxFFgnmDMqXul9nAOe9Nq2AAa1jFrJlrgeQ413St9
         V0pFH5qDTtzWfQriRia1fGrBGZ0LzzLui4BM6PtmH0utUiBol58oPPceY3mfLerXrUfn
         I71g==
X-Forwarded-Encrypted: i=1; AJvYcCW8avM6aIPrM6iQhCvaiaNZz6oSAa2hJgAjck0IFpWn8kGaiP57BFh2nlsRRBWUiSeuL97uxo8FZC7Sw/jQsTzCWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6myrfX+rECnNaQLmQhYNLqxEWIdB6136slVJ2O9hZ1hWGtoW8
	e0D/l7ct2fH/bnSimvvDxa7LnFwGOxUtex2ITaAVxzvPq0TkranhWwD0Q/aTT70=
X-Gm-Gg: ASbGncuPHp3nn7gEr55KCyVrkbsOSmOvE2GboVdA8XEH1nv4UQzgdBXoJmJUYeoNmNs
	aE4J/P9eaYk/06nK5S3z5oiXm6+bAm80+SavOlt2vmwypPE6RJzFiS4oSd5KjPJixSO497aqTW+
	AjisFT9XlvCV74ujVosLqyrZbvNqx8e/zWAsVgbpxioDrxos/LEK+NreZqviK1CamD1+oqXm0KP
	sUni950usZSTpxo6OFteNsmkn0tCNfKb3X5Do+BbLqybwzw/l0LS3YbaDMMSanijGP1YSUKVIS6
	ZhX4Zh55bcisvPSoHe9Eb0aPPdPIj4npMiUr
X-Google-Smtp-Source: AGHT+IF40kzvTmeRV0SLh7JPWC/BmStsOxDXj25ZVmdU7p18eSuHRlcLVaylhOrmOqfz9B6DJ2UrcQ==
X-Received: by 2002:a5d:5f90:0:b0:385:f0c9:4b66 with SMTP id ffacd0b85a97d-388e4d64767mr6779273f8f.33.1734613673423;
        Thu, 19 Dec 2024 05:07:53 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm17436705e9.6.2024.12.19.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 05:07:52 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 19 Dec 2024 13:07:46 +0000
Subject: [PATCH 1/2] dt-bindings: mailbox: add support for referencing
 controllers solely by node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-mbox_request_channel_by_args-v1-1-617a6910f842@linaro.org>
References: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
In-Reply-To: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734613671; l=1946;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=1yf/YbX5zzLVOPLgM9Mf3iD1fLxwVX2uCkX7LRhP57Y=;
 b=73v7sR57R4aQx/YJWHUxGp/CxrhVmSD74UnblBJ4DVkdsJAKq1xaT2O5VdZSGL1GGLJRbSanH
 61XYqh9IhL6AXZvYy040Qec9Tor97M/d9bMF8JF4KqLS+B5w682WxlH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

There are mailbox clients that can discover the mailbox channel ID at
run-time. For such cases passing the channel identifier via DT is
redundant. Add support for referencing controllers solely by node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/mailbox.txt | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
index af8ecee2ac68..0c4295a62f61 100644
--- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/mailbox.txt
@@ -5,9 +5,10 @@ assign appropriate mailbox channel to client drivers.
 
 * Mailbox Controller
 
-Required property:
-- #mbox-cells: Must be at least 1. Number of cells in a mailbox
-		specifier.
+Optional property:
+- #mbox-cells: Must be at least 1. Number of cells in a mailbox specifier.
+               The property becomes mandatory for the cases where the clients
+               reference the controller via the mboxes property.
 
 Example:
 	mailbox: mailbox {
@@ -19,7 +20,11 @@ Example:
 * Mailbox Client
 
 Required property:
+Clients must reference the mailbox controller either via the mboxes or mbox
+properties.
 - mboxes: List of phandle and mailbox channel specifiers.
+- mbox: phandle pointing to the controller. Used by clients that can discover
+        the channel identifiers at runtime.
 
 Optional property:
 - mbox-names: List of identifier strings for each mailbox channel.
@@ -29,7 +34,13 @@ Optional property:
 	  communication between the mailbox client and the remote.
 
 
-Example:
+Example using mbox:
+	power-management {
+		...
+		mbox = <&mailbox>;
+	};
+
+Example using mboxes:
 	pwr_cntrl: power {
 		...
 		mbox-names = "pwr-ctrl", "rpc";

-- 
2.47.1.613.gc27f4b7a9f-goog

