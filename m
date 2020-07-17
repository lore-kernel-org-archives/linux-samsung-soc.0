Return-Path: <SRS0=qGKp=A4=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A54C43458
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Jul 2020 13:55:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 243EA208C7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Jul 2020 13:55:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LTF03lW7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgGQNzI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 17 Jul 2020 09:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgGQNyf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 09:54:35 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CDBC0619D4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jul 2020 06:54:35 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z15so11192866wrl.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jul 2020 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HtRzZ5KmeCiCWZA3g8vq3ZlMKJB7i9QBYHFK4C8GH0s=;
        b=LTF03lW7kEJAH5aMocIcsUzVWKAAABsB7rRAQmExZ4VoAYuhMbb4bcfHA0awvwbIDn
         fSkxCfo/z71K8EDTbTRd1sVt8VejJPdF8NuHRjTZxmZonr2ag+LnYAaMzozlvyj/Cb5E
         PWgYZBTaStJPspQcjcGfuT8bJBxeDTvRJ0sGTQqibirjPdbO9pmPQ7kUKwHMotEFdyKo
         MCB7tcYRiYbE8rd+eUj1eVl/BPcWVE6wBcLZhlVqdWLaOOma3YFofkP6BA3dPq9kNNRI
         8PItgM9yXEDb1k7nXRz+os22F5zYnJ0UhBHCQb8OoWOH804RCJZrIwdQb5vBvWHvE7ZZ
         xA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HtRzZ5KmeCiCWZA3g8vq3ZlMKJB7i9QBYHFK4C8GH0s=;
        b=ZlOFngNuyaZZDklQNN0IdC6Xz/8yb3sVayvuAPv3gYguAcpBfoL44ZzgnVDlteEMnO
         9sYzzqs8WSZQ4GXnm8bjyi57YjQbZBngzNDpsHYdZrePPu70WRQtZBb/XpboqIw9a1H7
         vGEsDYY3QkiAnksD92zlPIonHp1BGkmInB7KnqVooC9D4H17Xwhk6FSVtUd7iNt7KAEk
         TDUd0XB57dCw33u00cNi43binhIpjFhdmNTuAWO3tJXUhDuBu866cZubeI2EdhH+VEBj
         wwwyRLiiGvNjzw0R1IJBTOzGSJ+003dUwPeOzp/1TNegG1x3bw5+DSEotS1Fu8LytXD1
         u0NQ==
X-Gm-Message-State: AOAM532UvGXPxgAhj0/LS0hyRQdSDDn2I09zEoQAumIHl8+SZrMu77Eu
        wFpkyjC8kga3Sq8S2TUFeW3vhA==
X-Google-Smtp-Source: ABdhPJyHX3PoYRsGFUxGkeeCqGttR+NzV972E7ncV9J1A49qk+XgxXs6FMRDtU1LSi15aefSC1/YWA==
X-Received: by 2002:adf:8486:: with SMTP id 6mr1234507wrg.109.1594994074147;
        Fri, 17 Jul 2020 06:54:34 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id w128sm16118356wmb.19.2020.07.17.06.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:54:33 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     broonie@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andi Shyti <andi@etezian.org>,
        Jaswinder Singh <jassi.brar@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 07/14] spi: spi-s3c64xx: Add missing entries for structs 's3c64xx_spi_dma_data' and 's3c64xx_spi_dma_data'
Date:   Fri, 17 Jul 2020 14:54:17 +0100
Message-Id: <20200717135424.2442271-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200717135424.2442271-1-lee.jones@linaro.org>
References: <20200717135424.2442271-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/spi/spi-s3c64xx.c:150: warning: Function parameter or member 'quirks' not described in 's3c64xx_spi_port_config'
 drivers/spi/spi-s3c64xx.c:150: warning: Function parameter or member 'clk_ioclk' not described in 's3c64xx_spi_port_config'
 drivers/spi/spi-s3c64xx.c:189: warning: Function parameter or member 'pdev' not described in 's3c64xx_spi_driver_data'
 drivers/spi/spi-s3c64xx.c:189: warning: Function parameter or member 'rx_dma' not described in 's3c64xx_spi_driver_data'
 drivers/spi/spi-s3c64xx.c:189: warning: Function parameter or member 'tx_dma' not described in 's3c64xx_spi_driver_data'
 drivers/spi/spi-s3c64xx.c:189: warning: Function parameter or member 'port_conf' not described in 's3c64xx_spi_driver_data'
 drivers/spi/spi-s3c64xx.c:189: warning: Function parameter or member 'port_id' not described in 's3c64xx_spi_driver_data'

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi@etezian.org>
Cc: Jaswinder Singh <jassi.brar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index cf67ea60dc0ed..924b24441789a 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -130,9 +130,11 @@ struct s3c64xx_spi_dma_data {
  * @fifo_lvl_mask: Bit-mask for {TX|RX}_FIFO_LVL bits in SPI_STATUS register.
  * @rx_lvl_offset: Bit offset of RX_FIFO_LVL bits in SPI_STATUS regiter.
  * @tx_st_done: Bit offset of TX_DONE bit in SPI_STATUS regiter.
+ * @quirks: Bitmask of known quirks
  * @high_speed: True, if the controller supports HIGH_SPEED_EN bit.
  * @clk_from_cmu: True, if the controller does not include a clock mux and
  *	prescaler unit.
+ * @clk_ioclk: True if clock is present on this device
  *
  * The Samsung s3c64xx SPI controller are used on various Samsung SoC's but
  * differ in some aspects such as the size of the fifo and spi bus clock
@@ -154,6 +156,7 @@ struct s3c64xx_spi_port_config {
  * @clk: Pointer to the spi clock.
  * @src_clk: Pointer to the clock used to generate SPI signals.
  * @ioclk: Pointer to the i/o clock between master and slave
+ * @pdev: Pointer to device's platform device data
  * @master: Pointer to the SPI Protocol master.
  * @cntrlr_info: Platform specific data for the controller this driver manages.
  * @lock: Controller specific lock.
@@ -166,7 +169,11 @@ struct s3c64xx_spi_port_config {
  * @xfer_completion: To indicate completion of xfer task.
  * @cur_mode: Stores the active configuration of the controller.
  * @cur_bpw: Stores the active bits per word settings.
- * @cur_speed: Stores the active xfer clock speed.
+ * @cur_speed: Current clock speed
+ * @rx_dma: Local receive DMA data (e.g. chan and direction)
+ * @tx_dma: Local transmit DMA data (e.g. chan and direction)
+ * @port_conf: Local SPI port configuartion data
+ * @port_id: Port identification number
  */
 struct s3c64xx_spi_driver_data {
 	void __iomem                    *regs;
-- 
2.25.1

