Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37992E8DE4
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Jul 2025 17:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751907933; cv=none; b=D9Vn1c/y5d4gwxSd+dtKliJN1l4sfMpyuJ7A89N+YAdkr+dgF8I35cGTtGLbNZTxTBdq2p7WiEKfdq8u8bB6SbEhcC47Gfx0tSoy69o2IrJ0z1aJYpZL0l5qaJ6OVPOQfYe/LF27lwIeMDf1vQjlhjX5uKa6mwQ5cImtb6Ykq0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751907933; c=relaxed/simple;
	bh=V7GVXPeniRjfSBXgyWCdSqUUNadL/PC4wB6+w+kmXrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gHbNvMmsXnJad1twHKHJyNDIYaWCZBvlUqNo7yupmiWrb2qsyWjCPLc5RgxLEMpVH0I8+9eR4qfDtXCTz8ws/C6PYa7coOoTWnGug06x+78oSNFvz6v+6wORb3zC8r5JbpkID794bOjbFUFrf7INKJFG8RrON2YTJD8iqwbbTOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GfQ3D63d; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GfQ3D63d"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso717336666b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Jul 2025 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751907929; x=1752512729; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=57rYJvDLr2D8w3kMcZW5Qve8k2sDHgGAExSpeGzzFo4=;
        b=GfQ3D63d+nGazbk7+lWB93ffVNPgxydPzyZXj3KGUyz/vIms4FksdDaxrU0xQ429vw
         rx+TtugBgSOEJDFoHPbvG9HYkXmSU6leJ+pqVLcTfaj8G7FcqCEW5S89ZoAWI+SEDzgV
         R+dCV2bGR+srkCuQrAUqx9k5W6qnKDVtbbsZ+xPEpCd5+oZ28ot9cUeQi1R9kpBT5WUv
         AFaWPypwbM1YUFnO4YHJFENdKPAxbUQgkL1KI5BWHacbYjjWvfmR+/Z2A+/Fd8vZCHTa
         byUzedF4qHVgnhNVvmiIeNvVMGqmkWFKwxDl207Q6MGm5nGKidGmgu8kCcce9jdkyxQ9
         Zt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751907929; x=1752512729;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57rYJvDLr2D8w3kMcZW5Qve8k2sDHgGAExSpeGzzFo4=;
        b=NgjSu8hzVUGolWR7SCWKLYZPBFPnR2Yg91HjLvDIcGve3URomfkEIrbkFn0pEAh+MU
         Uod+v/UJ80KeQfNZXjU1Q3t9u5w5tMnBRrUjKCdi8Wwl4pKig7AbrR9oI6ZuXpgcWExi
         8rM8jYwZci3TpgxHZigHydc2yMvcm1ieMDR4dCfJkX5asETsZaDanzlVMddGuhgM8mS3
         001HWfTCcC8AGz9hzBJ3DONrnPa0notOpySLT9Y65YKFWj8ebgoCnrA7phfqVydHKZEQ
         RNp9ZOCEfux6nUuUh4fjNZHDbP0Zb+pckZY6K0N66VkmcOyWK7JK/qEuFzz6TsTINWdc
         oz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4PYGsD9ZvBLU9x+Qdxd9+7W4WWMpimgHePRE9OFw7uRNrYcazZygIXwVqp3TtKhhGP8/LSVI+5HUWCh41zBDCVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRmDF22S0ZkI6SOdcNuRIHGA0mg57IautruJfVwCEo4rOQJEHt
	Cc8YFtkV2LgfMcemWKxp5JujF9xPK0SWJdO8xwW7FxuYlRS95KSrgMmi4gfoe2h6Jqg=
X-Gm-Gg: ASbGncsirOx1JlppjamEf5iVGqcO3mxImD2pEYznkliy+S4nJm4EgsjAHPL/qRmvpWH
	oZRYcWoEgFOpDm+YeBg6eV+Mz+2fFJoVxpLxFJX/kRyq/N5iq1RpMAZpCLx5qCdPEr80lTWu8Mr
	6rzXBAUwpAQHvrEwnNkhLapWW8wR+PxReqn/T1H8oypPKGDUZM7GzMrWV3rHypcXrHPqyCepMlf
	g/GKCXqsiM2spu8DwMp9yNGMmD5sq2PA3i4ngmJrlQCrEx+tKNMbCJRGcr14f9n6tPiVK/sAupi
	RFMmKyZ5gdXyNEOKtxADliswqWnHxOUSJNbdcudwV0X0p0+qNlamwB9fzE0zWKWvFzsaYuneUEC
	pURh1KtwNwaF7Tx8y2NcCzfV7BcxdZCdgiYY9z7gGuO9YVA==
X-Google-Smtp-Source: AGHT+IH39ie4cMyXIg4z35kSN5NcopH3AiyCIAZ7/0N31t7b87LaPnUMjOhDIkjPEUdI9Xt4zZAZOg==
X-Received: by 2002:a17:907:3c91:b0:ae3:70cb:45d5 with SMTP id a640c23a62f3a-ae3fe741335mr1295648966b.48.1751907928992;
        Mon, 07 Jul 2025 10:05:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac54a0sm745507266b.109.2025.07.07.10.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 10:05:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 07 Jul 2025 18:05:27 +0100
Subject: [PATCH] scsi: ufs: exynos: fix programming of HCI_UTRL_NEXUS_TYPE
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-ufs-exynos-shift-v1-1-1418e161ae40@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFb+a2gC/x3MPQqAMAxA4auUzAZqqT94FXHQmmqWKo1KRby7x
 fEb3ntAKDIJdOqBSBcLbyGjLBS4dQwLIc/ZYLSpdKMbPL0gpTtsgrKyP3Cq51K3lkzrLORsj+Q
 5/ct+eN8PxFjj5GIAAAA=
X-Change-ID: 20250707-ufs-exynos-shift-b6d1084e28c4
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Seungwon Jeon <essuuj@gmail.com>, 
 Avri Altman <avri.altman@wdc.com>, Kiwoong Kim <kwmad.kim@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

On Google gs101, the number of UTP transfer request slots (nutrs) is
32, and in this case the driver ends up programming the UTRL_NEXUS_TYPE
incorrectly as 0.

This is because the left hand side of the shift is 1, which is of type
int, i.e. 31 bits wide. Shifting by more than that width results in
undefined behaviour.

Fix this by switching to the BIT() macro, which applies correct type
casting as required. This ensures the correct value is written to
UTRL_NEXUS_TYPE (0xffffffff on gs101), and it also fixes a UBSAN shift
warning:
    UBSAN: shift-out-of-bounds in drivers/ufs/host/ufs-exynos.c:1113:21
    shift exponent 32 is too large for 32-bit type 'int'

For consistency, apply the same change to the nutmrs / UTMRL_NEXUS_TYPE
write.

Fixes: 55f4b1f73631 ("scsi: ufs: ufs-exynos: Add UFS host support for Exynos SoCs")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 3e545af536e53e06b66c624ed0dc6dc7de13549f..f0adcd9dd553d2e630c75e8c3220e21bc5f7c8d8 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1110,8 +1110,8 @@ static int exynos_ufs_post_link(struct ufs_hba *hba)
 	hci_writel(ufs, val, HCI_TXPRDT_ENTRY_SIZE);
 
 	hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_RXPRDT_ENTRY_SIZE);
-	hci_writel(ufs, (1 << hba->nutrs) - 1, HCI_UTRL_NEXUS_TYPE);
-	hci_writel(ufs, (1 << hba->nutmrs) - 1, HCI_UTMRL_NEXUS_TYPE);
+	hci_writel(ufs, BIT(hba->nutrs) - 1, HCI_UTRL_NEXUS_TYPE);
+	hci_writel(ufs, BIT(hba->nutmrs) - 1, HCI_UTMRL_NEXUS_TYPE);
 	hci_writel(ufs, 0xf, HCI_AXIDMA_RWDATA_BURST_LEN);
 
 	if (ufs->opts & EXYNOS_UFS_OPT_SKIP_CONNECTION_ESTAB)

---
base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
change-id: 20250707-ufs-exynos-shift-b6d1084e28c4

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

