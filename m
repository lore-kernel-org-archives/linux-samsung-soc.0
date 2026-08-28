Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1363C456F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Aug 2026 05:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895420; cv=none; b=ShByFN5TOhUY1jvWoNQ2E3db/SSHNYIQ16rfY//Y6sK167NtfAdy8d50lhUcyFXwFnNdpV4cHR+x83sw1tQtwZ9NGjFmLX9HKI5ON2l9hEiIMi92lxMbblrgOAP5R2IZEQjkM3WLlO5k5G1IOAiBZSBdym82yAk6j9I72hIGNaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895420; c=relaxed/simple;
	bh=wtfUQzmcELOnphwEkWCuJmpEvP3biGaNxI4z501YE9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0szJhHuLh8MBfzruTXPJT1T/T8C+LsnaoxwzwPyIl1C2hOFewDJZoiualwvjWRYPcoUL3dlxnnON6ZOBFbL9BpTyAX8wJLxUQrYNQTJC7SHovXl8xhEsGXrJBiwGxV1q1it2GFfxmAXu2tga3jh83bVx/zkwyXwPpzlipLUQOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rZ8nl9Ye; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rZ8nl9Ye"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47de0093c42so548334f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Aug 2026 22:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787895417; x=1788500217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEJ19k6VFkGLeF0T3A8fZtY496MybQptAygVYIkcbbY=;
        b=rZ8nl9YeTup1XM3glFTdIWG027M3i0pXWtyCZo2u5iZdk1viZIW/VpOQeK/YCDfxL/
         hLeITP/gVpkGxkji5fRaZa3rnR68NpYYQGLIoU74AaVO1kelyB3cDJRjlD1OFGHYq6DC
         kPhio7ZtG8erBvwRLl20tvOX0FIo3UuF6XMjtsf9fGKv2xYq7jen7oZ7olJrNVncypPS
         yBNvpgBAfhJvUZOnpa7l2z2tDDz4FiClo3sBBEygtkkSMUydzvKb6vc4FB8DB8ROECMh
         5f8yzAuEr2NcgWtrHsIQUkyqSw8fBxyckympJXzXk8j6pPSxCc+AnPzDf6dq1iq/0FYp
         SPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895417; x=1788500217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEJ19k6VFkGLeF0T3A8fZtY496MybQptAygVYIkcbbY=;
        b=RMGEdBvDY4TQLUXpSRKoyoRnVXUHYG7mbu48IM1rhw58TsqCDe0rZC8A2PKmyBQa9C
         W9GY7yKZCl8894+Yk4A1YHH7dJ0y09RtN1G80/jISCKcXTtGqQf5O9diM2am8mNa8lr4
         PG44+kSVvjSJ5ggHI4lr9VreO19d52hX6Z7azb7Zk/Rhr3lZ6s1ZGb1A9ogc2Yl98cm0
         WLr8Hlrw55+8kv5QU467Qi4UQCGw7V8KGMbBfSusXjfDaS1E2avFg7jAjewpO0j59k0U
         7w1eqCczi2TbSoKQtA5Jp0j+dPZLj4sr38rSNqCpFcPMwq8EWsvytjnS50BF8Cyqq6Sy
         zQ6g==
X-Forwarded-Encrypted: i=1; AHgh+Rrnfy5c1zfNOgsRkZC8V+JZXk15hTZFXr1XL8Bpxpqk8FYpdHIDIouNe3a88JucCf0nsaqGkcykhVOUJvE1G3CKlA==@vger.kernel.org
X-Gm-Message-State: AFuF++kVMhEY0ig1UWrhKbKTCOYJ9wxFyHEv3CvwH4E8MM5Nly7BV8yN
	qWIf/236pDLMeNennArrApI2J86ydsvxIcDXdbGydh6PAWkqx6wIxDFP62f77O8Cpa1FROWMuGg
	Bvt28
X-Gm-Gg: AR+sD13n3cle1ezPGfgW369WjmS3tTenUnYc9KzCiUcmfE5+E0BDE/PxIm0WhVIcC6c
	HQgPH+NXF2oZu4jNzvlg6f/pTXXDGQK6dUJJ1uJMZ6/BM/2up3UJW37PZIpPj7Mwm2LUplKaDlW
	VoLWDLi5PPGpsqq0yNAfng8DkRnSOHFS2R3hw3O+5yEvOhx76Cz9XhXMOkMkYHMgWNbUpJYWHcV
	OeCVnoNK/OgLXPa3NmKUWmfTO+9t7GOkvQYxPuVfeOZfw4chCiX7wvk09AKU22WAtuNIYyL2u/t
	8qaTsKbrz86gzMERZVorWoKKeK0R/Yy2Dt+Obzx+y8wrmTN/v3l7E+qjznu4JlAvqyozeNfADeB
	pAbQm9vpfHx1yl/KqHW5pAyCM11T/0aAvQhmjiPK55G5G+lgXXPWAAHhXoKlqFm+9GlXPHuJhtB
	/0jo7W7bxCKKxrMutHUsupsZwUpDbPDxBiBU9f2IMIRYDXn6YRtuGnj9rKT7131RFv/E0qAvhpH
	mk53pmm7TxybJzWt6A7y+jt5ih3XFPsTJVJS+rTch3Cbjk99kAL
X-Received: by 2002:a5d:5f50:0:b0:482:e263:2c7e with SMTP id ffacd0b85a97d-482f79b351cmr6273357f8f.13.1787895413969;
        Thu, 27 Aug 2026 22:36:53 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4d0asm1410402f8f.10.2026.08.27.22.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:36:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 28 Aug 2026 06:36:47 +0100
Subject: [PATCH v2 2/2] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-2-06bce6107bd6@linaro.org>
References: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
In-Reply-To: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3

The setup_cpuhp_and_cpuidle() initialisation sequence currently ignores
the return values of cpuhp_setup_state(), cpu_pm_register_notifier(), and
register_reboot_notifier(). If any of these registrations fail during
probe() routine, the driver returns 0, leaving the driver partially
configured.

Furthermore, if anything after setup_cpuhp_and_cpuidle() fails in probe()
routine, for instance devm_mfd_add_devices(), the probe() lacks an error
path and leaves notifiers and cpu hotplug states registered.

Introduce variables for the cpu hotplug state IDs in exynos_pmu_context
struct, that should be initialised to CPUHP_INVALID by default. Check all
return codes in setup_cpuhp_and_cpuidle(), and add an error path to remove
registered states on failure. Finally, add destroy_cpuhp_and_cpuidle()
helper to safely tear down notifiers and cpu hotplug states.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs101")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 63 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index efccdd63e40e..fce922d5ab92 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -38,6 +38,8 @@ struct exynos_pmu_context {
 	unsigned long *in_cpuhp;
 	bool sys_insuspend;
 	bool sys_inreboot;
+	int cpuhp_prepare_state;
+	int cpuhp_online_state;
 };
 
 void __iomem *pmu_base_addr;
@@ -407,6 +409,17 @@ static struct notifier_block exynos_cpupm_reboot_nb = {
 	.notifier_call = exynos_cpupm_reboot_notifier,
 };
 
+static void destroy_cpuhp_and_cpuidle(void)
+{
+	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
+	unregister_reboot_notifier(&exynos_cpupm_reboot_nb);
+
+	if (pmu_context->cpuhp_prepare_state != CPUHP_INVALID)
+		cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
+	if (pmu_context->cpuhp_online_state != CPUHP_INVALID)
+		cpuhp_remove_state(pmu_context->cpuhp_online_state);
+}
+
 static int setup_cpuhp_and_cpuidle(struct device *dev)
 {
 	struct device_node *intr_gen_node __free(device_node) =
@@ -458,16 +471,46 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 		gs101_cpuhp_pmu_online(cpu);
 
 	/* register CPU hotplug callbacks */
-	cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,	"soc/exynos-pmu:prepare",
-			  gs101_cpuhp_pmu_online, NULL);
+	pmu_context->cpuhp_prepare_state = CPUHP_INVALID;
+	pmu_context->cpuhp_online_state = CPUHP_INVALID;
+
+	ret = cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:prepare",
+				gs101_cpuhp_pmu_online, NULL);
+	if (ret < 0)
+		return ret;
+
+	pmu_context->cpuhp_prepare_state = ret;
+
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
+				NULL, gs101_cpuhp_pmu_offline);
+	if (ret < 0)
+		goto clean_cpuhp_states;
 
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
-			  NULL, gs101_cpuhp_pmu_offline);
+	pmu_context->cpuhp_online_state = ret;
 
 	/* register CPU PM notifiers for cpuidle */
-	cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
-	register_reboot_notifier(&exynos_cpupm_reboot_nb);
-	return 0;
+	ret = cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
+	if (ret)
+		goto clean_cpuhp_states;
+
+	ret = register_reboot_notifier(&exynos_cpupm_reboot_nb);
+	if (!ret)
+		/* Success */
+		return ret;
+
+	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
+
+clean_cpuhp_states:
+	if (pmu_context->cpuhp_prepare_state != CPUHP_INVALID) {
+		cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
+		pmu_context->cpuhp_prepare_state = CPUHP_INVALID;
+	}
+	if (pmu_context->cpuhp_online_state != CPUHP_INVALID) {
+		cpuhp_remove_state(pmu_context->cpuhp_online_state);
+		pmu_context->cpuhp_online_state = CPUHP_INVALID;
+	}
+
+	return ret;
 }
 
 static int exynos_pmu_probe(struct platform_device *pdev)
@@ -541,8 +584,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 
 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, exynos_pmu_devs,
 				   ARRAY_SIZE(exynos_pmu_devs), NULL, 0, NULL);
-	if (ret)
+	if (ret) {
+		if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp)
+			destroy_cpuhp_and_cpuidle();
+
 		return ret;
+	}
 
 	if (devm_of_platform_populate(dev))
 		dev_err(dev, "Error populating children, reboot and poweroff might not work properly\n");

-- 
2.51.0

