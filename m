Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDE1293B65
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139007; cv=none; b=jtJFVBnLGQiKa9J0vb40Uf7rrb4AtUZAHpBwpQUsdo0ZuXXEE713hHHXjt6OzgKsZXmdaTKndLagWUADJ6VzgD7XDxmYYZ+OsSLxvWTHd+DMKTgStpy9UGXCmVPJ+65ptsbgSh0CveYSFwaKJmcKS4MdE/pWHERnI8qQIfmV/q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139007; c=relaxed/simple;
	bh=ALwJqxoH5zAinvmbBAPI1a8edV2GbWb9vLZOWS7SaNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jCWCrwJ9PFuKVbmE051CvJCTXPd+3hh2yYkfekP9najZRE7W5BJPsGaQhb0/BXY7CkGefA0cc02n4Pr+yRBbrOuoVoU1FKgocJjrUXC6TwYnF0GJaazrSLmZ+UdymWrRuHM7nTj3iDu/jJ1J/n2XVU4IQx6h47TqKjPuAJlqXbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlnz/Ynw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlnz/Ynw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A7RjiA016792
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Omsp8mXp75/hXn7qkFWCOKSdc9pZVj0sVSquHLqjEXQ=; b=hlnz/YnwwphwltN1
	B59JKt/4Cda3W++kZCcYOo9CUN2kq5szLGlvUjEnJN+hHg6XkqySGAIX9kQIIt7L
	yrSufKUVrc/KR4S2bSfNKA380RSozNd9AgKSBBzx4eS3yMxCVAZm8j8y7yOClmvp
	LLDXTzNmRH0uL2jaQlSmOisOnSjCMULev+gXx2boFoy0eodr5fHT2uH0Bp+9Q6LT
	iSjO6AjrB8xVeHDwSwL9cFkRia7oTfDG9y/2LnYkem+xoIYk11EbPDgd3Kax1Do4
	1+8qtWyq/c2hdkNwC+lwYBwx017JrvAnatQCzfezEv89DTTcdRAjWFeIrIAypGR+
	T1I8Bw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnvb4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:16:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31215090074so1498054a91.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 02:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139004; x=1752743804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Omsp8mXp75/hXn7qkFWCOKSdc9pZVj0sVSquHLqjEXQ=;
        b=wR0hyf3wkF6clPIxOPAVn5tOVeQKKhvs4Le3YIkIWRCOS4OSIWicbDrgBGbNSXs16N
         GT8Q+kEyLQdo11+XbYfIWr+ZwxXeNY9s7bTWQO2P2PQLlAZl35E0hrt0uhnPqebNjl9H
         XgIub9mcm/u91RRsWtgDZo7VqEwooX1bJXheYetuU/YyoFwVDH6ekGcDXJCO3O70wqqR
         8VYwl0Hh7nJ+iWvbzMyBMZ2GyRALr/y5m8Eh2w8NpmiuTBVkvbkJcYqN92FwKZxGPXfa
         H5W0fKEQqXhKFcVa/oXMIlsb87BAc4wHx6dfCffamykz4E8fbZ10ouhYIimqzV/qEN7Q
         7yXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVSi0pS8toDfUohkaOdnhbGciVKj1BkAo2sPvhoZaehniaZjykQs5cvgod4fG1IaNmoTKZIyk9AWYJzPDRFRcimQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ZuEYSqGnyrwbXZkG73S7TxZPc70/rm53VejhtojPr5NYYvnN
	YRtpJ4dg7Xg3MG3WDYAFvjrk328vdwIYuzFkrq80526xFQ8uFF7E1/9ujjYcEq1QTysAYnLkoMY
	uZGIOduO6JN/BRS7DlCKCjVyCnrQ0jxm/PzQaJ9cs+TLxkNRBWWvb+FGuTVobw7vJSD0D7R+1AA
	==
X-Gm-Gg: ASbGnctHanL/uqGlQVvxTzI9PZtY3/Pln3rd9znqZuQ5oWiHIrysezm2eN1ELAgPtJ1
	CqoAy+qMABy2Pvt0uaiHHKMEYtl8Nbv2lhMSjtue3GYbVtJlLUomqZCbObyHZlF0w0SwMkn7l0M
	ICOmmy6KqSW7exaycOoymrizju8cvj/9F+EQoNXVUS9IUuhiB1rklhszb7m9DM4UyGqVSEGdQRh
	rZznXAh6lklk0tOxSmtPHGaIS1veSQBHalFppSzK5TvB+2Zw/Tq+R7kbIgaZGaE6GdeVE3gSRGS
	UKK7a4LyuTdNW3FTQNqpiMJkGSIFpyWu63pfWHIFD/kYTh0ouigUIXv5dEk=
X-Received: by 2002:a17:90b:4b83:b0:311:cc4e:516f with SMTP id 98e67ed59e1d1-31c3f0524b3mr3115605a91.31.1752139003756;
        Thu, 10 Jul 2025 02:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRkahqT6M3goz801R4gyUSxZaZcpl0nbaLVmNgBBfdCc7fPM+qe8CygBRAKPCeG1ssUoQs5w==
X-Received: by 2002:a17:90b:4b83:b0:311:cc4e:516f with SMTP id 98e67ed59e1d1-31c3f0524b3mr3115552a91.31.1752139003251;
        Thu, 10 Jul 2025 02:16:43 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:16:42 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:43 +0530
Subject: [PATCH v10 01/10] power: reset: reboot-mode: Add device tree
 node-based registration
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=4006;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ALwJqxoH5zAinvmbBAPI1a8edV2GbWb9vLZOWS7SaNs=;
 b=zmpgmDmSEZpp9iMryNZpCeFDIhc8RonTeW5+eqo2M22DtBxd4MaQSjx8XESzBCnjrPGhO181y
 zLKXkvptGoEAg7h41Z8ubtMkQzWYl+N4cZV+M+0O/SV3DXVGoygQFwA
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX55wDER8LzMW5
 cLlAqmdfyns6Jx/mPvFxC6ye6hxAlI4+w5GXvgGetbS140jmqnt55GcakpCqTOXDvOPHyAVoBnE
 9Rypw6Uo/zs//CS4691+ejVECQAh7wbWX7mUUkG8Bq3FM5+bLXQxpvZ7e3gcOBn1jjDdnw++D92
 3WdbpDmN+T9g6SvgCYqb/3qTmkwtMcr/Qg7oEJzgQUcWEJs95LjTJhn9ZsL6mocitf8eZsWpPR3
 e9oUtRQtBP+36cORqRaeuuPLMsnvRwnZttqjhQnweBg9jtlV6tTAdNOg+stLN/MeSDjOmv0PaaA
 qWWzoYzaR/T01YiChzc5bvhhthuHIrF1Y7lIJcq9KCOqistJI+c+OL2gh0JJMDki9SUM7i/crir
 L31m5HOy0xCIShDHoIaSibqMpl3Zcxd+za4gs9cgLH43MVfNybj57ATQWNBCrMGm2kUjHSlS
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=686f84fc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=i5N5rYY7EEs6P5za-RUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: TMTv1CrZHH9OJLHj0E23t3ifmgGanMVQ
X-Proofpoint-GUID: TMTv1CrZHH9OJLHj0E23t3ifmgGanMVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100079

The reboot-mode driver does not have a strict requirement for
device-based registration. It primarily uses the device's of_node
to read mode-<cmd> properties and the device pointer for logging.

Remove the dependency on struct device and introduce support for
Device Tree (DT) node-based registration. This enables drivers
that are not associated with a struct device to leverage the
reboot-mode framework.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 23 +++++++++++++----------
 include/linux/reboot-mode.h       |  2 +-
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..61f647b23959789a313f3af0bd967abcad45fa43 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -12,6 +12,7 @@
 #include <linux/reboot-mode.h>
 
 #define PREFIX "mode-"
+#define pr_fmt(fmt)	"reboot-mode: " fmt
 
 struct mode_info {
 	const char *mode;
@@ -65,14 +66,14 @@ static int reboot_mode_notify(struct notifier_block *this,
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
+ * @np: Pointer to device tree node
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-int reboot_mode_register(struct reboot_mode_driver *reboot)
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
 {
 	struct mode_info *info;
 	struct property *prop;
-	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
 	int ret;
 
@@ -82,16 +83,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
 		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
+			pr_err("reboot mode %s without magic number\n", info->mode);
+			kfree(info);
 			continue;
 		}
 
@@ -102,8 +102,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
@@ -130,11 +129,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
 		kfree_const(info->mode);
+		list_del(&info->list);
+		kfree(info);
+	}
 
 	return 0;
 }
@@ -162,7 +165,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
-	rc = reboot_mode_register(reboot);
+	rc = reboot_mode_register(reboot, reboot->dev->of_node);
 	if (rc) {
 		devres_free(dr);
 		return rc;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..36f071f4b82e1fc255d8dd679a18e537655c3179 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -9,7 +9,7 @@ struct reboot_mode_driver {
 	struct notifier_block reboot_notifier;
 };
 
-int reboot_mode_register(struct reboot_mode_driver *reboot);
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);

-- 
2.34.1

