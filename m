Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C6C1C5D59
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753452983; cv=none; b=rc6viux8rxJxgStPa16KWCEK/HNoN5mu4WLUVDhg7au60ryu+vCVEPQCRezOYl2c6o0Bb1/W4vH/EDQ1Tnj1Cm8YpPpSk/ucETelAxE3DRCX/JRssCm5p0Tc4qCQrXa9/5y2EGr4aX2Vrtc01FD76oT/PnlIZ8hGEpPABfrNECk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753452983; c=relaxed/simple;
	bh=Xip8jE5pNwtMgx7ORp3HsgqbQwAw/yGfdOPBmn7/ojQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=loHH+FEi62RR6jTCbr8Oytcpfn8fvGQBO9KBjvXrhstNx2LjlrDDaf4f2vtQhkw5aVmjDH0ZNKJz7Xivd/yr/qG0xjjIIThEAC4tqxGx7ubqP3j3pIfn+9vgMAoF6Qq7Ibr9GPQWhuqdNocT8tEPmTt/KQ9EaNWW5pkqCD3zN00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qa5fzeGC; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qa5fzeGC"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso386786566b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753452978; x=1754057778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zam/LW3oj60VYDi/BrVgQJFij9S3YsCyteAYO8PX1E=;
        b=qa5fzeGCaPC7T/LANLBabBtX9iOfWWLDcXhdXjjKv4h96ps0BDv05BoMs6+cHbr7YA
         9wjbMSLbv8YqFDk3BuXvRnNx9AaMwLKASd9oehza2BDJnfLX3iEMnOJ/YO5lfOU9HszQ
         /cylqojecTdDERHbC8v4pqhkUgKKP2oJ2NRg8ybd6p37z8GwzvahflWZ5jzzv0L+Nb13
         AnEsgrjsSqb+oHrLgKdhzMYc6c14cdaaFcodT14LHa7hddAyrnLgjU0QmnD11pBdSutv
         rARAB67OwXYOiVSNlfB91NVpb/5Adnocnf3cX/dV4y8hGlXaeW1VJaBkEKZZoqqOMB4S
         KK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753452978; x=1754057778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zam/LW3oj60VYDi/BrVgQJFij9S3YsCyteAYO8PX1E=;
        b=aa9E7Neu5VSxadC10yhvworeKW92JOD691Q5Af4MQJiqA8zBnBAU5Y1jGjXGZfbtIP
         qwVkIvT/vL7hH/4T5iOFE3rJQZe78fJmzTmnmZhJFRi8XJQ5wPvRiYBTIQb6H1egQHJs
         7+kI3fXsXAxAYOhFI+tdeT/xBl0oFnivefz7lY/rpz8mrXsIhLmLgwOF4KOpQfboS+ba
         7o8+TpYJ8817Eai4p51Q2bHbkKqZsRDO2WNZA8mT6nhzaBV//8knyUo8+HG7kGrhCc0Y
         61NdxqNoAHjqGJq/+GiDjskzMLknNpGOtqROEjVB5hCF11u64wHV+eaJ6YeW8B3pmLo/
         SjJg==
X-Forwarded-Encrypted: i=1; AJvYcCXjGHAaAGxaNrCEUUOeDgihTAa1F2/RvxTz3RTKHAlEwwNR/Ysq/jSv4/4l/b3cHUxkKB/6ibzkuFQetP394s/yhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTBkd79iR9vgxw0n/g1/doPzUwfqOZbcv7CiAbjg1jsE5JHOV0
	1yM17wzTuX0EJKLHSRkQzOGxnOrbu9QJHYyASipKLFnJ2vA+hAWt5yWU4NgvdVriKr0=
X-Gm-Gg: ASbGncstXtcnnZSfv0lqEldT/Z3uPquAV6xpX8j6bzEA4VXv+ikPmH7ss+n9cHdHoAb
	/8Gg9Dpz9Gm2fuCYVnJ072ji/YnJj+74OmbwF8KRaloohTaHaHi5FcXzdBsUu0gmJsk2wZcKGHJ
	KTl0XAL47tz0exc/PsXse2/kYoshWYJXZfe0eO/mruEHUnBiaYp9zskPoySz0nIpGG4aibmluiX
	d/Owsjb5nJrb9bj/QT7T7XWc0WXg5G7UQsKRD4d0YkKaox/Yv3RhtB72YC88iqNZiLYqmLGNHsd
	yVQpeO1AOfM6cB9AtbwcpoLOsSLpeh9jQvpmU6OCE8nhlcfwW5PHDE0lfNiHK024PdrUUEBsEzL
	twE3V1hnpsWS4mjIXf9gQWV9wTk/PsLPT6g3RstSWsACjesp+iB8GqASgHHSFelijc+kf2VlcNM
	d21HzMlA==
X-Google-Smtp-Source: AGHT+IFX5GnNzDHfFClTllxEfxM5knR3JPoKqdSRHH8rDBPQpxv4Ttm+JHD8dxakGBd8eBWGd9ILPw==
X-Received: by 2002:a17:907:9623:b0:ae3:c777:6e5e with SMTP id a640c23a62f3a-af61df52d26mr252419366b.19.1753452978372;
        Fri, 25 Jul 2025 07:16:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f85e60bsm278398966b.96.2025.07.25.07.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:16:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 25 Jul 2025 15:16:15 +0100
Subject: [PATCH v2 1/2] scsi: ufs: core: complete polled requests also from
 interrupt context
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250725-ufshcd-hardirq-v2-1-884c11e0b0df@linaro.org>
References: <20250725-ufshcd-hardirq-v2-0-884c11e0b0df@linaro.org>
In-Reply-To: <20250725-ufshcd-hardirq-v2-0-884c11e0b0df@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, kernel-team@android.com, 
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

When commit ee8c88cab4af ("scsi: ufs: core: Fix the polling
implementation") was added, the block layer did not support completing
polled requests from interrupt context.

This has changed since (presumably with commit b99182c501c3 ("bio: add
pcpu caching for non-polling bio_put")) and it is possible to complete
polled requests also from interrupt context.

Therefore, this commit here changes the code to also complete polled
requests from interrupt context, mostly reverting above referenced
commit as it is not necessary anymore. We do keep the fix to make
ufshcd_poll() return a positive number.

The change has been verified using:
    fio --name=randread --rw=randread --ioengine=pvsync2 --hipri=1 \
        --direct=1 --bs=4k --numjobs=8 --size=32m --runtime=30 \
        --time_based --end_fsync=1 --group_reporting --filename=/foo

which appears to have completed with no errors with this commit.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 13f7e0469141619cfc5e180aa730171ff01b8fb1..d8e2eabacd3efbf07458e81cc4d15ba7f05d3913 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5613,26 +5613,6 @@ static void __ufshcd_transfer_req_compl(struct ufs_hba *hba,
 		ufshcd_compl_one_cqe(hba, tag, NULL);
 }
 
-/* Any value that is not an existing queue number is fine for this constant. */
-enum {
-	UFSHCD_POLL_FROM_INTERRUPT_CONTEXT = -1
-};
-
-static void ufshcd_clear_polled(struct ufs_hba *hba,
-				unsigned long *completed_reqs)
-{
-	int tag;
-
-	for_each_set_bit(tag, completed_reqs, hba->nutrs) {
-		struct scsi_cmnd *cmd = hba->lrb[tag].cmd;
-
-		if (!cmd)
-			continue;
-		if (scsi_cmd_to_rq(cmd)->cmd_flags & REQ_POLLED)
-			__clear_bit(tag, completed_reqs);
-	}
-}
-
 /*
  * Return: > 0 if one or more commands have been completed or 0 if no
  * requests have been completed.
@@ -5656,10 +5636,6 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
 	WARN_ONCE(completed_reqs & ~hba->outstanding_reqs,
 		  "completed: %#lx; outstanding: %#lx\n", completed_reqs,
 		  hba->outstanding_reqs);
-	if (queue_num == UFSHCD_POLL_FROM_INTERRUPT_CONTEXT) {
-		/* Do not complete polled requests from interrupt context. */
-		ufshcd_clear_polled(hba, &completed_reqs);
-	}
 	hba->outstanding_reqs &= ~completed_reqs;
 	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
 
@@ -5747,7 +5723,7 @@ static irqreturn_t ufshcd_transfer_req_compl(struct ufs_hba *hba)
 	 * Ignore the ufshcd_poll() return value and return IRQ_HANDLED since we
 	 * do not want polling to trigger spurious interrupt complaints.
 	 */
-	ufshcd_poll(hba->host, UFSHCD_POLL_FROM_INTERRUPT_CONTEXT);
+	ufshcd_poll(hba->host, 0);
 
 	return IRQ_HANDLED;
 }

-- 
2.50.1.487.gc89ff58d15-goog

