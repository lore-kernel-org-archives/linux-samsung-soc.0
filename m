Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29132727FC;
	Mon, 23 Feb 2026 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771866348; cv=none; b=CK45ZuJlZceGnO289hagjrVMmRp3r3db1cP/m0wqMLEexScSXLwwOLxwE15P+y+5iP9fxODMdcjLZ1Tm1B9v3d81FXKgeBgmuK97H9xXVaLzBtsnQPs4e0wOL0k5d1BqJt6/7BLmHRDjVkjiRxj65ZLTMZW9fLFGmc7Q4HqzOf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771866348; c=relaxed/simple;
	bh=LVFzllSloWoOaF21bDE/8kEXnUUxiA/Ig/7YIS6Bvlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPMDr6VCiqIuP1KV5cHzwyiXkFkA5jt4Vwyf5O5R4yLcxixC3sSVy4nliTXEEp0+EXH2sZsFH2Ej+3LxiUPcwnyyMIHnQziED2k1IvtpFid39tjlfD1+PegJ4Anh/TqN8AoIh+D1XEBBXHER31gxiajgqyPpngmvNQhQQMyyojQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PesqEyqR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PesqEyqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4310BC116D0;
	Mon, 23 Feb 2026 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771866347;
	bh=LVFzllSloWoOaF21bDE/8kEXnUUxiA/Ig/7YIS6Bvlw=;
	h=From:To:Cc:Subject:Date:From;
	b=PesqEyqRg+siu8i4WJqokKfppcs3B6vrvvTYnp2IohSwb5sdovPCH5tghmE4SvGUR
	 0yXwKHyZ3/5ccqzQhm7AtE/H/SsbQv5Zf8IuFWdrM1PQQCkkHjPnkhGuUe3bIvz0Ob
	 WI3llk7u8WUoosEb311o5gtZle05+GJ6gZsHOJs8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	stable <stable@kernel.org>
Subject: [PATCH] i2c: s3c24xx: check the size of the SMBUS message before using it
Date: Mon, 23 Feb 2026 18:05:15 +0100
Message-ID: <2026022314-rely-scrubbed-4839@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=LVFzllSloWoOaF21bDE/8kEXnUUxiA/Ig/7YIS6Bvlw=; b=owGbwMvMwCRo6H6F97bub03G02pJDJlzOk6pGV9pq+u8vc0l4qbNkTRxUUX/DD0HubIH0nda/ DJFlP90xLIwCDIxyIopsnzZxnN0f8UhRS9D29Mwc1iZQIYwcHEKwESeNzLMj56/N3D7vyPTy81u uTdOlpzus92/j2HBEjWTv3b6phLbplvPFD/Zv1BV4QYzAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The first byte of an i2c SMBUS message is the size, and it should be
verified to ensure that it is in the range of 0..I2C_SMBUS_BLOCK_MAX
before processing it.

This is the same logic that was added in commit a6e04f05ce0b ("i2c:
tegra: check msg length in SMBUS block read") to the i2c tegra driver.

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: stable <stable@kernel.org>
Assisted-by: gkh_clanker_2000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/i2c/busses/i2c-s3c2410.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 8138f5ef40f0..15e14a6fe6dc 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -503,8 +503,13 @@ static void i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 		i2c->msg->buf[i2c->msg_ptr++] = byte;
 
 		/* Add actual length to read for smbus block read */
-		if (i2c->msg->flags & I2C_M_RECV_LEN && i2c->msg->len == 1)
+		if (i2c->msg->flags & I2C_M_RECV_LEN && i2c->msg->len == 1) {
+			if (byte == 0 || byte > I2C_SMBUS_BLOCK_MAX) {
+				s3c24xx_i2c_stop(i2c, -EPROTO);
+				break;
+			}
 			i2c->msg->len += byte;
+		}
  prepare_read:
 		if (is_msglast(i2c)) {
 			/* last byte of buffer */
-- 
2.53.0

