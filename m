Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808F313C690;
	Mon, 10 Mar 2025 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741595217; cv=none; b=WD5TMcT8xrMxZuadTTiH+7igzRWDATB3LixxbGwsVWu14EN4useQZSGQ3GQf6Fndz4jDOs5S623TeariIqdkI0ZDXoEvR9dLWi4qE12a0JK6UZrJqIlT3mdHFyZ1l8PqAxnz3BusRZtEnDDATrYH7v566Ldy0QX5AFWlwzZEK0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741595217; c=relaxed/simple;
	bh=4bqibF+pyk6rtMGUAI6R0xqJ7JY5Wx46sZY/br36NbI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RMxZSg1eGvYPaPXzGHqwl2oPHSgIOqAo/xm1AqCn+MlrfyQa4jk2JjcjewnPfJB4TPeYusPzAS8HYlx7i8wTJccRdidxnNMfbAZaWuHCBInq2OJ5IRb2dY4CUaqPjtCEU3QPTneiiMkv5OQ9FhI7WujNaYYZtXotbRaHIc6SjXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowACXnw9Dos5nDkXkEw--.39080S2;
	Mon, 10 Mar 2025 16:26:44 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: tudor.ambarus@linaro.org,
	jassisinghbrar@gmail.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] mailbox: Remove unneeded semicolon
Date: Mon, 10 Mar 2025 16:26:28 +0800
Message-Id: <20250310082628.845544-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXnw9Dos5nDkXkEw--.39080S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXw4DXFWDtr1kZrb_yoWfJrc_u3
	Z3XF17Wrn0vFyYvwnxt3yruw1jva4rZwnaga92qFZxZ348Zr4jqry2vrsYy343ArWkZF1a
	ka4UJw1Fkw1UZjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r1q6r43MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUyE__UUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/mailbox/exynos-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index 20049f0ec5ff..2320649bf60c 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -57,7 +57,7 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
 	if (msg->chan_type != EXYNOS_MBOX_CHAN_TYPE_DOORBELL) {
 		dev_err(dev, "Unsupported channel type [%d]\n", msg->chan_type);
 		return -EINVAL;
-	};
+	}
 
 	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
 
-- 
2.25.1

