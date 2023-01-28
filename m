Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9302C54EAA
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 28 Jan 2023 00:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjA1AyD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Jan 2023 19:54:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjA1AyC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 19:54:02 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DC359E4C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 16:54:01 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id e8-20020a17090a9a8800b0022c387f0f93so5237767pjp.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 16:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aGNQjbpF5iVZwBpwuIDtp51as1jRAvk6dpQFHMl4cAQ=;
        b=WlSAgM5xsZcQ1tyz8q/WmXqA6zvbDEh0sM/ucn78Be6UwwKTfaboOjFXbzPw4dXEYn
         HpKEilhklAMjOFyWVBdRUpO9gOAymZDBbUUsKZjgdMTI+/GYEjLefoY5PqXFum9+F2Ee
         P6JJ7iRXQS1C1K9qqsj113/yDQo3KheUT1vHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGNQjbpF5iVZwBpwuIDtp51as1jRAvk6dpQFHMl4cAQ=;
        b=elIkYOXU+UjYCaqUVEQpRi63v29URf5PQxyr4dJiu35+1ITeEUaaGhoIQvB9cVrR4r
         ePIodMHwHjP+Y3wx0Gf8Vhx6utTt14v8O3FyljLLIFOf+DvsaaYLz7QiSGHTS/qESHQb
         Lr5eQrQ+p+R4r3nC/1jDbTybePLQuEllx7j15QOAKbIr1zAGE+85f9xrPfI4RkNXFLlN
         4x2vGzMFQ5QVFcBw4JWByFN0ml6QMJOHoN5/Eh4gANiLChBpL3qUujHEoYKU1X/hpfCq
         HZJSSFWgQ8AEI82JV3jzlyFX6xvE1I/XhMI+nL4Rryk02kIsAzZlxBGqeAA0t+aJTP1f
         RYNQ==
X-Gm-Message-State: AFqh2kqAbnfeiiOJmVQRCrqqSSIvUfVWCvGAPYnEfv7j5CwJ+VO4g3wB
        od3P8BI+bntTlPsZ0XDNFakHeg==
X-Google-Smtp-Source: AMrXdXvbIIADGSuS6oZFtxBvipPOM8DYtn4VKqkHM9KzfFrpV1Bs628tYwr+8p0JfOHRnzW+ApPqYw==
X-Received: by 2002:a17:902:720a:b0:193:25b6:71bc with SMTP id ba10-20020a170902720a00b0019325b671bcmr45467594plb.25.1674867240807;
        Fri, 27 Jan 2023 16:54:00 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x10-20020a170902ec8a00b0019488090884sm621plg.273.2023.01.27.16.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 16:54:00 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH] regulator: s5m8767: Bounds check id indexing into arrays
Date:   Fri, 27 Jan 2023 16:53:58 -0800
Message-Id: <20230128005358.never.313-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619; h=from:subject:message-id; bh=z69EuUx8ff+TuAWIFlth8OkbW4QJXglaM+pgN7cDLw0=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBj1HImuw1FGUELvtteAxEQidLJKG04IF5hSb5Qx4Ay LaU2d9OJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY9RyJgAKCRCJcvTf3G3AJs2nD/ 4u4NMgmpO2HlCvIeDLNVJpWWfqUxY1WDcLogyO9762ngiPL/2ao/rW8nhJnk4Izl8fUaCoqb8Rkf2p OMtvKw9ZvA2MkOJ4MzBO6d+vUImZRxPoA3/9sAGvChoIRE6rBWy19t0vJuGCSCvLOwGHP8rVcGfTrK a9sr/i/XFf6nFnZ6q1sOI0K89pZdQRolhyEgj5yfe3CJeq0J+LdC4EMG1w2ZWwkh04yFhKskD6TeZC xry/ENgw+KUQ2pDBDZXvqnYs8SwSkWg98jXma+uEUPnrOnDHpQhwicM1+gCdGkjLjkATrfINyIR6SG zjy0vu/tpXQYYN81rckBk1vMAF5dvyGS1dBcF/M7DpxWthKAT0CKn+M+6woakLbUGo9LN8rpILmI1p fyxAC7cw7VJOHOp3qQop6seagaPgBqzxGxbddIYVE1tcXPD9GItInTHRfkODfkgVCuZ9EDS3c4l9gy CYkohJTCKdk5jxkl1X7E3zoLqhpUAU8Bt3tCxxABVIiCbF7z2K+/QmTFkKAa0hpJe+uzGFKBB6D4m5 maiLs9ta/6r7faKNStoa4hBESavTniRiektCBgnVIg8iitKOcwCJmTaft41xZtS5PgIs1gHO2/E4S0 RBvELB5+oxnqI87ypfrYzKjD/+kp2SuAXB1SjSl/vi35f8ftLDZnDXNyuOZg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The compiler has no way to know if "id" is within the array bounds of
the regulators array. Add a check for this and a build-time check that
the regulators and reg_voltage_map arrays are sized the same. Seen with
GCC 13:

../drivers/regulator/s5m8767.c: In function 's5m8767_pmic_probe':
../drivers/regulator/s5m8767.c:936:35: warning: array subscript [0, 36] is outside array bounds of 'struct regulator_desc[37]' [-Warray-bounds=]
  936 |                         regulators[id].vsel_reg =
      |                         ~~~~~~~~~~^~~~

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/regulator/s5m8767.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 35269f998210..754c6fcc6e64 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -923,10 +923,14 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
 
 	for (i = 0; i < pdata->num_regulators; i++) {
 		const struct sec_voltage_desc *desc;
-		int id = pdata->regulators[i].id;
+		unsigned int id = pdata->regulators[i].id;
 		int enable_reg, enable_val;
 		struct regulator_dev *rdev;
 
+		BUILD_BUG_ON(ARRAY_SIZE(regulators) != ARRAY_SIZE(reg_voltage_map));
+		if (WARN_ON_ONCE(id >= ARRAY_SIZE(regulators)))
+			continue;
+
 		desc = reg_voltage_map[id];
 		if (desc) {
 			regulators[id].n_voltages =
-- 
2.34.1

