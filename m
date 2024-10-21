Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41F51FAC37
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2024 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729522353; cv=none; b=BzgspWn8yTFGgbJhuslkGiVVZddX3u9J57ff1Amuj8IqkNe+FA7jgqI0FzqVQaCYdycU9NOKY1BPjmxFrYpyg+26b39oAjj6rKwmWGXTZJ3PKD9JUkrXyIrHZNNJQSPXGzWxNIzoZDLD26kmzj1U5bgWPSdnYeq1vJNb2YIG6fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729522353; c=relaxed/simple;
	bh=qHkv5JDlqgqjZRZ7PQwcwLcJ3/hu2L0ISUVO1CYr6r8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NfkCGcSznuVuYRKkdZcUT+DqNHyZzyIJl1Tw263g3YOGCyvoLCjy2kP4wMGfCIUBzupERQI+tvT78sCm4EKebshkxgt62wJHlR6964xYj9c23abOhtTc/0oMwiYox0IMd9nKC9sRVdTUeSAH9tv67DF0UXIR85+IcgkxbjBHJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbZRNizu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbZRNizu"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37ed7eb07a4so1611056f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2024 07:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729522349; x=1730127149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QjSRnQx5O46OacBUYkVWL1KnGLuYW+NCz+8zrCnNmA8=;
        b=FbZRNizuUuz+5GZEl+Xn6dQ4LHT8jpTIC9/cD0imTsGIRrkIQisHIy6XEaIU4E7tpr
         2qHa/1JK6d3X4abywQgEHdzL+jqa2Qdk7yU02JHpHkD48nmslu0BxEDjT7YFMC98hob/
         nLukdGRo8Ez3E7n3DQ64VlaBtqu3enChbAL3WCGmkjlDmMV7X739v7pTem+yMy4AnPf9
         g7ULuw64/n2C6AS3iOf/v8iJ7yVk0wAmWjPtrNNsDCOoA4SQWKI7gWoPQDR6nO4cDbc/
         JuJMgulCSRLQP4uLUnOu5iheZMnEpNHdhdWcFMAfAaFqAoALJH0lWLqabpTcYolXlXo/
         0aqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729522349; x=1730127149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QjSRnQx5O46OacBUYkVWL1KnGLuYW+NCz+8zrCnNmA8=;
        b=GXrVO4XlteghUGJNK2sSUq1dcLPzrwSdwBof6EYKIEEHHlppNklFHEw+IIgP5pZW6A
         VY4PkyjZpsJkqHSWHJAB87l47dkQjj6mzVBhFDEfLAQA6dE+CJb6/VemnK06btt/xSg1
         6jR32WYH1BtjgiH6YhIa27X9aFGxsFy/BQZxHnitK7mpUGTEtiwjITf6IMGH7m+IdHTU
         SWVmfIE+88O6fv6+ayH7IlqGQU8XUwfb1uOYm6Z+lFASncwmRrF2JbmC+DovM/RsZnmb
         ipq0fPt1HN26PZh7W6h8Klqjt0YleeNpxwvLYiHrMO8Xibg4twS1UbyM5bbNln72cCnx
         d5qg==
X-Forwarded-Encrypted: i=1; AJvYcCXvmrYdQTqnc5jXJoYh6w3FAD+lpNXLMUWmZMSIFGIKo3/sfm3pzF4C80IZPitBc9XKhV6/Camu4/8xnL7ajPn8JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ+lLvQrUmQ8wZjZB4sWbQO6rCa/Dqt9LMwjBUQjCqX6wRV8xc
	PCh2qLcM+k3N1ypOnA90P7V/MveQpavwiN4sJBunBT3bmlxVrmR6ZjfV69Wwx/c=
X-Google-Smtp-Source: AGHT+IHR6qQguq7PH3Uh8RSkz2aVOh856iqdHv7IWaGdljT9tcnvh9y5umzoNMsFeKBw9U5YBzOTaQ==
X-Received: by 2002:adf:e542:0:b0:37d:4f54:f9c8 with SMTP id ffacd0b85a97d-37ea21c8569mr7292650f8f.33.1729522349069;
        Mon, 21 Oct 2024 07:52:29 -0700 (PDT)
Received: from [192.168.0.157] ([82.76.204.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a3805esm4552502f8f.9.2024.10.21.07.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 07:52:28 -0700 (PDT)
Message-ID: <5f31c010-a965-48f3-a975-efd8307316bb@linaro.org>
Date: Mon, 21 Oct 2024 15:52:26 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
To: krzk@kernel.org
Cc: alim.akhtar@samsung.com, mst@redhat.com, javierm@redhat.com,
 tzimmermann@suse.de, bartosz.golaszewski@linaro.org,
 luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com,
 bjorn@rivosinc.com, ulf.hansson@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, marcan@marcan.st, neal@gompa.dev,
 alyssa@rosenzweig.io, broonie@kernel.org, andre.draszik@linaro.org,
 willmcvicker@google.com, peter.griffin@linaro.org, kernel-team@android.com,
 vincent.guittot@linaro.org, daniel.lezcano@linaro.org,
 Jassi Brar <jassisinghbrar@gmail.com>
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-3-tudor.ambarus@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241017163649.3007062-3-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/17/24 5:36 PM, Tudor Ambarus wrote:
> +static int exynos_acpm_chans_init(struct exynos_acpm *exynos_acpm)
> +{
> +	struct exynos_acpm_shmem_chan *shmem_chans, *shmem_chan;
> +	struct exynos_acpm_shmem *shmem = exynos_acpm->shmem;

As Krzysztof has already noticed, I need to use the __iomem pointer
token when referring to shmem structures. This could be caught with
sparse as well, lesson learnt:

   drivers/firmware/samsung/exynos-acpm.c:493:54: sparse: sparse:
incorrect type in argument 2 (different address spaces) @@     expected
void [noderef] __iomem *addr @@     got unsigned int * @@


The following changes will be needed for v3:

--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -161,7 +161,7 @@ struct exynos_acpm_chan {
  * @num_chans: number of channels available for this controller.
  */
 struct exynos_acpm {
-       struct exynos_acpm_shmem *shmem;
+       struct exynos_acpm_shmem __iomem *shmem;
        struct exynos_acpm_chan *chans;
        void __iomem *sram_base;
        void __iomem *regs;
@@ -485,8 +485,8 @@ static void __iomem *exynos_acpm_get_iomem_addr(void
__iomem *base,
 }

 static void exynos_acpm_rx_queue_init(struct exynos_acpm *exynos_acpm,
-                                     struct exynos_acpm_shmem_chan
*shmem_chan,
-                                     struct exynos_acpm_queue *rx)
+               struct exynos_acpm_shmem_chan __iomem *shmem_chan,
+               struct exynos_acpm_queue *rx)
 {
        void __iomem *base = exynos_acpm->sram_base;

@@ -496,8 +496,8 @@ static void exynos_acpm_rx_queue_init(struct
exynos_acpm *exynos_acpm,
 }

 static void exynos_acpm_tx_queue_init(struct exynos_acpm *exynos_acpm,
-                                     struct exynos_acpm_shmem_chan
*shmem_chan,
-                                     struct exynos_acpm_queue *tx)
+               struct exynos_acpm_shmem_chan __iomem *shmem_chan,
+               struct exynos_acpm_queue *tx)
 {
        void __iomem *base = exynos_acpm->sram_base;

@@ -527,8 +527,8 @@ static int exynos_acpm_alloc_cmds(struct exynos_acpm
*exynos_acpm,

 static int exynos_acpm_chans_init(struct exynos_acpm *exynos_acpm)
 {
-       struct exynos_acpm_shmem_chan *shmem_chans, *shmem_chan;
-       struct exynos_acpm_shmem *shmem = exynos_acpm->shmem;
+       struct exynos_acpm_shmem_chan __iomem *shmem_chans, *shmem_chan;
+       struct exynos_acpm_shmem __iomem *shmem = exynos_acpm->shmem;
        struct mbox_chan *mbox_chan, *mbox_chans;
        struct exynos_acpm_chan *chan, *chans;
        struct device *dev = exynos_acpm->dev;
