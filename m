Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3F828C5D1
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139101; cv=none; b=HLl/sw5szGKIjkTpHIGUSCWzZwSFRlATg9UqQzG1f7+LBayk5mSvFiXZMIGe5X9DnwC3L4JRV4neBpab9qTBMm0pdyqs0PURdEzswe1DkXS3N+NOViY/vN+vhaWUA4aDWj7nso3+OLQmCsBFNbYkpiVeFcDuiR8fzmWFVy+HoCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139101; c=relaxed/simple;
	bh=Gh0wKF8f8obJZBIFY+YXRq0mvEFaXxY4KjC0e6ESP0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fWZdYpPv0ysnGZwtTZVWjcPl3f+/23hfGBJHIU0KnzgPUrODLga21RsmDQ+oUEJH9ylkxXJ7M4rwkJYDCUHUZD6jXYPEy99pMX3kECQRuBgSiorfFYulOr8O5pir9yttNfRm5pDKTVBxDic693W/kVcnoin8WO/HxZ7ZrCzPYQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhW8TMTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhW8TMTQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1Zmcq011293
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEQrgZfA5rhK7t8SJQh+Tq/CWC0djSnOhUUgfmLwz64=; b=WhW8TMTQz9Or+5Ut
	JV77FzjSJBAAEaojl+gFV7Zt/eGLI01ypAewarNdVghtsxF2oIGT3R2uBsC4Fifz
	sZXNEm7OopBVSXerUVYv7zTOkEXYpRO0bqiv5AukWGyOSFdNGBm/QrajE5LLYJKM
	dtKH00yzERyxM/vIxhFGx7QNoKPRFkRIXXVg4r5cLhNAXPMYx9UIxBKwr5x9SS4x
	axJWAO4HzKZ833OVJ8Vt0OP68tWBjTFuYcg2lr4jT+qoxOOSEe/ILATnfYIsFtvW
	uW0iOGtC3IUBiKhfuHzJBf33uzKm1hkJg3B9OANZv2zVPByDU9gF0N7j2D60IdR0
	2lv4wQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafmauf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:18:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23dc7d3e708so4989795ad.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 02:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139097; x=1752743897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEQrgZfA5rhK7t8SJQh+Tq/CWC0djSnOhUUgfmLwz64=;
        b=fhnrScLGQFKJQ6hsgUs9w2C51+5fzxtVf0nzWWI4RkcWVikK0HWHzE543DWxutOAmQ
         fPU+vTyuEmy5wj/x8oNQX/oO7rGPzNLlx6JvFoOH72mM9YFsYoo/9acjwed4vpF+PcfT
         +yuWoRUXfqOXBTGtXdPPTOFDaVtjkGvv3qEzk5EM2dHu3IagkMSZYZJBiG7S2y8AGEIg
         lqqJnk7pcrhTVwdWTk5OkGDptPLV3tD8AeroABoFWGtMMF78v7DZSErcjlHC+8MAvU1w
         qrUhyd2MQPtmkHXzYYbJslEMM2NpRl/Vtmzlw6v1Xjd4WU8trtSStvxYxPpnPJqYPmbI
         EQ6A==
X-Forwarded-Encrypted: i=1; AJvYcCW4cqv7ND2nzIFxC7F1QKWug6hCb7GgXH6XzHvB44g3JeIQR1i+TEy+GVe5/RRAj0HWaebIPnO3vTJYYT36CKyy3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnxbjgzQAMUNvQvCLCet2U6IE4Ot2JLY6WuUCoOK611+ZSsrjg
	z61Fy7twUF42qKLR00BYjZNDP7KkkBfw1icBJOavZv7GprieZwszM6AvnIDClUvqEoW8gJ/2j++
	jrKvPbEjclm84VoBGlgtwRetf7u1VP14PfqYNT/nIp+Gjppk+0v3KxlcYlFx53A4dGFiWYLD5gw
	==
X-Gm-Gg: ASbGnctRrOQwaFnFzunE65EiKNzrttJyyzwBsga8CIG8dbYY80Szs5zuoBABIyA7wXL
	DscrkVur5ONK60fnXNKqqMo5PbWcavXz+BZ+CjqaViUo0kkbZYj5Ui+7t0cKnetz6DIC/2UIpED
	Hh59Mo2dX0mrNPNfak/tSTQz0iqTXqRnYUrt7J5bwSUPBuJOdM9zExADC2Hb94ybgYir+Uovi9V
	Rh5rx7T6LAQz/rsQiEbrBUYTPB146VTG2ZXFh+4vroc1y08Fzg1RXd1S2ei2d/HwJOBiTVl6NtU
	ugFqe7q9YS3MHtZQ6SWeCiPSYLlMOiaUI41OACKHOrLFGpFd+PmDndzwP2o=
X-Received: by 2002:a17:903:1103:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23de480adf5mr26734885ad.8.1752139096990;
        Thu, 10 Jul 2025 02:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGJGyoIrfBA9Zxl0Ughrj3uMKfz6jdSKT0NaAjnNjMskqdtkAKMLUS8x/FzIhDGTyLMPqU7g==
X-Received: by 2002:a17:903:1103:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23de480adf5mr26734395ad.8.1752139096442;
        Thu, 10 Jul 2025 02:18:16 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:18:16 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:52 +0530
Subject: [PATCH v10 10/10] power: reset: reboot-mode: Expose sysfs for
 registered arguments
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-10-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=5404;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Gh0wKF8f8obJZBIFY+YXRq0mvEFaXxY4KjC0e6ESP0U=;
 b=lw/w70/5HLBy4afjvzlsoilkn9KNGxxeob32fKCnRPLyN8EQy03rSeyCWxEC8VvLFF42hMkAU
 +dipiHJKDdAD9k39uxR5AmQE0RPKWUW9koD6OoeU2qqjpwjX3QrfMdd
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686f855a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=YvCmAYiu2kffolCFmWcA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: he8PDUYuyQ_Cd_-4K4QHpdbHE5haXH08
X-Proofpoint-GUID: he8PDUYuyQ_Cd_-4K4QHpdbHE5haXH08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX8D4b5H4lmpaL
 /lQ6Kbt7k92XyvLIzPf4qEH9r06LoOKaSBxlJbgljs4irCr9zbiaGCr4oRsMDaZnnX4H5o22mv2
 Vl9+HGbcMSOnuBRC/lESWjDJB6SR5P3fLXdQx7w2lE0og6FMpeOl3OODjMP5jRwSp5Uymms5zC4
 yW/ERZ2OguGXaLjuS0P7aXx0ne/Qza3Of6ad8lFGNs+CBCfrw+E2DWelD8tU9gZ3P5m9DklUnm8
 J+uwFfL7kqqW9efiYMW9kEYExr3prdEFO5FKivSbkghVynvz119Y6nbk2HZUc/u0DUmVh2Utt90
 OeBlK1Ab5ezoMvmiTfh3l9daK2J54ZvyDFA+x3DCdeA6XED11sAeSu3RbWSRTCtjD6yZYxwuvRb
 SwP54LMdZJ68PQdAXzBBuLsUNpP7X+Qw7qSxkacSctqD31RMSK+EaJJ3VM8sG0sIYj/DMKvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079

Currently, there is no standardized mechanism for userspace to
discover which reboot-modes are supported on a given platform.
This limitation forces tools and scripts to rely on hardcoded
assumptions about the supported reboot-modes.

Create a class 'reboot-mode' and a device under it to expose a
sysfs interface to show the available reboot mode arguments to
userspace.

Create the device using the node name of the driver that
registers with reboot mode driver.

This results in the creation of:
  /sys/class/reboot-mode/<driver>/reboot_modes

This read-only sysfs file will exposes the list of supported
reboot modes arguments provided by the driver, enabling userspace
to query the list of arguments.

Align the clean up path to maintain backward compatibility for
existing reboot-mode based drivers.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 95 ++++++++++++++++++++++++++++++++++-----
 include/linux/reboot-mode.h       |  1 +
 2 files changed, 84 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index afadd823d62d0f7e7e645746b978cc8fecfb9ac4..128192d49d895beeacb180c1a92b44a5eddccc78 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -22,6 +22,8 @@ struct mode_info {
 	struct list_head list;
 };
 
+static struct class *rb_class;
+
 static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
@@ -70,6 +72,79 @@ static int reboot_mode_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+static void release_reboot_mode_device(struct device *dev, void *res);
+
+static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct reboot_mode_driver **devres_reboot;
+	struct reboot_mode_driver *reboot;
+	struct mode_info *info;
+	ssize_t size = 0;
+
+	devres_reboot = devres_find(dev, release_reboot_mode_device, NULL, 0);
+	reboot = *devres_reboot;
+	list_for_each_entry(info, &reboot->head, list) {
+		size += sprintf(buf + size, "%s,", info->mode);
+	}
+
+	if (size) {
+		size += sprintf(buf + size - 1, "\n");
+		return size;
+	}
+
+	return -ENODATA;
+}
+static DEVICE_ATTR_RO(reboot_modes);
+
+static void release_reboot_mode_device(struct device *dev, void *res)
+{
+	struct reboot_mode_driver *reboot = *(struct reboot_mode_driver **)res;
+	struct mode_info *info;
+	struct mode_info *next;
+
+	unregister_reboot_notifier(&reboot->reboot_notifier);
+
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		kfree_const(info->mode);
+		list_del(&info->list);
+		kfree(info);
+	}
+
+	device_remove_file(reboot->dev, &dev_attr_reboot_modes);
+}
+
+static int create_reboot_mode_device(struct reboot_mode_driver *reboot,
+				     const char *dev_name)
+{
+	struct reboot_mode_driver **dr;
+	int ret = 0;
+
+	if (!rb_class) {
+		rb_class = class_create("reboot-mode");
+		if (IS_ERR(rb_class))
+			return PTR_ERR(rb_class);
+	}
+
+	reboot->reboot_dev = device_create(rb_class, NULL, 0, NULL, dev_name);
+	if (IS_ERR(reboot->reboot_dev))
+		return PTR_ERR(reboot->reboot_dev);
+
+	ret = device_create_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+	if (ret)
+		return ret;
+
+	dr = devres_alloc(release_reboot_mode_device, sizeof(*dr), GFP_KERNEL);
+	if (!dr) {
+		device_remove_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+		return -ENOMEM;
+	}
+
+	*dr = reboot;
+	devres_add(reboot->reboot_dev, dr);
+
+	return ret;
+}
+
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
@@ -84,6 +159,10 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	ret = create_reboot_mode_device(reboot, np->name ? np->name : "reboot-mode-dev");
+	if (ret)
+		return ret;
+
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
@@ -140,24 +219,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
  */
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
-	struct mode_info *next;
-
-	unregister_reboot_notifier(&reboot->reboot_notifier);
-
-	list_for_each_entry_safe(info, next, &reboot->head, list) {
-		kfree_const(info->mode);
-		list_del(&info->list);
-		kfree(info);
-	}
-
+	device_unregister(reboot->reboot_dev);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_unregister);
 
 static void devm_reboot_mode_release(struct device *dev, void *res)
 {
-	reboot_mode_unregister(*(struct reboot_mode_driver **)res);
+	struct reboot_mode_driver *reboot = *(struct reboot_mode_driver **)res;
+
+	device_unregister(reboot->reboot_dev);
 }
 
 /**
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index cfe18cdc2559be249969bba6c022940a508dd188..3aab8700a5961b90b07ed4d722c77484213ac6c4 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -4,6 +4,7 @@
 
 struct reboot_mode_driver {
 	struct device *dev;
+	struct device *reboot_dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
 	int (*write_with_cookie)(struct reboot_mode_driver *reboot,

-- 
2.34.1

