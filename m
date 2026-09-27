Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B368E358381
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Sep 2026 19:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536090; cv=none; b=Eggdd1bdHYD3GK8ynABs0B031Tzk0hYy7btmdkNDLW52CiJupLMD8XeOPzhLjZqsio5GmpUjClgv5nxGY5+CjlOiSrzNvvxhuxCV5nFmmqr4+C5BbgP+/iHreYezGKGyjvhKiZgUvjl3lZOba0w6ZiqCW4zFtae80pn/g6ba860=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536090; c=relaxed/simple;
	bh=h2liHw+Cb3T5OCreOlX8AWj3tP3/1dELU2ASsfx2NuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tJxKXDyfqJWVZ8YlTJqJRg3d15uA8dKmQXA1dhRGiJqidPZazVUfeKdPGqgQ6payZlFfLKF0Ng++CF2ezr30jMVqn2Jqi+cAaR7ByJuDs4CEpMI0eMlpoAFNVMPdgTWxbalhXTYX3fFA/sqIq3El2LwWNWsdWN6vFoZ8DuJyIDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3P73Cy0; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3P73Cy0"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace58so3339304eec.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Sep 2026 12:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790536088; x=1791140888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDDgjq+FLrfVveApew+3CiL9S8tkEEemKYxqci8Nfsc=;
        b=p3P73Cy0m/JAEVgMTPDvZ8gAy2t8YeP0+fMmxyFbB/6SvL2gYwvyvNfxRrWU2w6rEe
         /ScO/8ONQ+2k/8+wtc/sLvOq5FtcIK2SVGLJq1WJhjT09D7CphPhi/+V2LQ4WaELU/hj
         AQrK02teIAsEgiDDAUOtr3nS8h0US3f8VFumQ2PL5Lo3REUu4pw+FWt2KqcTA4awBdxi
         liNfHb81WgY/M6oxn/itDLt9tQBoEHZWO3qo1PEpnc5qHly7oTSWkQ8Bq2nr65af4vfK
         r+qm/yN1C7Am2IxIlD4itndRKt4EYbAUYIhnCIhSeIz3ljxewXvnMBPZCMyM880046mU
         pBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790536088; x=1791140888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDDgjq+FLrfVveApew+3CiL9S8tkEEemKYxqci8Nfsc=;
        b=dVm1xDbjTUHqrvXjTPttRtcW18xINO5veFXa0DieS4ImwyW+ixO4DcNOLo6sxZjS93
         HKLusD0pzMvZUhOp+520T9C3D5fGydNGvyErfqQz4olekE+G281nxixEj8D74rYG1lgR
         OsviVeeSaokUj/AsEll7plofuZVRB2PuVxowF9s8rR14IH9AsxyKPFHI0rHK8C8vgj3e
         OnUSQsRk9vfDa3OVFAVgbWWJhBzegn4Ppj47AQVYKSiQMwo48NzqZFy2y7pYkf7cgG1L
         MfI63tpwi6vIv58RWIZaAqX0HrJOnS9Au0GNNmQWTaWw3u5mQubeaI75WAFhUkeVIDCE
         dtiw==
X-Forwarded-Encrypted: i=1; AKwUvBxBRAWqMDj55iGmXIs3JGX8PPdClL0TX/OhG/waP+7U9w5vW+J1NG6lACB9S95ZXL88tyMl45aa80yhUSBTmpOQ4A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLoxEV4wucx5u9wc3f3sIf6mgobRPMmIKeCKckdR2SarqgGpFOL
	PcjM2iX/22QVuuTaCbUdgxdRSqPQFcgSYhpmGjUVWWyKWhKF1/vv1fviEHav00eg
X-Gm-Gg: AYBFou0TatZ9O/gr4tzqeIzAPJFNj9l3zr1bAcmfENIj9D6S3Aa50q3mZbVDOYJ+s34
	WNISUvYeCeBZpia1eICRaAh/OSqaExhd/FZMLzZMorh2jBT8Dksi/DFSRKiRfpIl+obCA67SW2i
	t1E+g/LRGSU9rkaeUXaTJCudYGQ3AiybE0Ps6lWMc41yijC28hogCsCe1FwTPKiPl1mwk8WXba+
	1oTyf48oqkblas95gjNkfbW7JQeP7bfFKeifVXCY+Rjyr4kPna0NrX0SBenLpUYQ2R6Ild2D2Vv
	RAaGy7oWP6bLLv8ExWBj0Sp6prUOr3EcicZfOZ7VLt8RnZO8cWuVSsBxLWo3JZ4koiZz7Lh+tbS
	cNEncRoAKR+2hZV/OEiKRfeIVgSLsWa3KCyX8MpH1vteP544QrWkBjRDSpDkszIaEALQcE9+WVv
	B/ktdJSLE7CVlM3wwF4tA55skeI3NtkwJvIvmh9AIpnCp6+8M966UPxMOzpDltr8oyQ5poJvyFS
	tEhJeXqI+sLtbl+Jj2xERUCTOU1
X-Received: by 2002:a05:7300:4f1c:b0:342:19b0:1c92 with SMTP id 5a478bee46e88-34273549d27mr7996388eec.35.1790536087021;
        Sun, 27 Sep 2026 12:08:07 -0700 (PDT)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:5bb1:340f:98dd:fd61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343580930e2sm13639702eec.16.2026.09.27.12.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 12:08:03 -0700 (PDT)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	peter.griffin@linaro.org,
	linusw@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	morbo@google.com,
	kees@kernel.org,
	justinstitt@google.com,
	aleksandr.loktionov@intel.com,
	codemender-patching+linux@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank names
Date: Sun, 27 Sep 2026 12:07:58 -0700
Message-ID: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bill Wendling <morbo@google.com>

samsung_banks_node_get() constructs each pin bank node name by copying
bank->name with strscpy() and appending the suffix with strlcat().

In preparation for removing the deprecated strlcat() API[1], format the
node name in a single snprintf() call, which preserves the existing
truncation check against sizeof(node_name).

Link: https://github.com/KSPP/linux/issues/370 [1]
Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 5ecc9ed4c44d..0d639eec689c 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1155,8 +1155,7 @@ static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_dr
 
 	bank = d->pin_banks;
 	for (i = 0; i < d->nr_banks; ++i, ++bank) {
-		strscpy(node_name, bank->name, sizeof(node_name));
-		len = strlcat(node_name, suffix, sizeof(node_name));
+		len = snprintf(node_name, sizeof(node_name), "%s%s", bank->name, suffix);
 		if (len >= sizeof(node_name)) {
 			dev_err(dev, "Too long pin bank name '%s', ignoring\n",
 				bank->name);
-- 
2.43.0

