Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D55678F3A;
	Wed,  5 Mar 2025 19:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741203428; cv=none; b=MawE4TNW1xmRkITtLM51ouO7pmm+zf7UdMHQN41Fl9t9Y3tyfcndfzQmT+Oqav67MVulGq+EGw3d3msfLfYXIbnoUwPx9yVBj1SeZqZbNf/OQCCxuOgLz7YgbDx8M7cBegr0QWDOC5NnX9/BClVzn3FKWfkCML4hUGg860L/DbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741203428; c=relaxed/simple;
	bh=ZyjrNEv58/rmyRtLUFlUsVfuA5ORw8U5QRMs6Ik/ZNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBbD9qLSOJiVNu9EmYgyCdBhxhfZ2EBJtuigjwxUt7k3zXqs1ORkAFoVbSnxZaWObK0kj5Kfs47ijxI5NaS29ttFHROiIqz9j/ADyUc9NB++fURjLwV/FAc4X5YTuk24pZLMHscx/7DbDnebZWezFOUCGJft/z1rdEAypqcyucQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWgDGbP6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWgDGbP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC49C4CED1;
	Wed,  5 Mar 2025 19:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741203428;
	bh=ZyjrNEv58/rmyRtLUFlUsVfuA5ORw8U5QRMs6Ik/ZNk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SWgDGbP6F9sORPpe4qKTEWAogi81SnzHF/WiC/JJ8gDSKaIN69eH/M4qcdi0Wv+3e
	 3UxXf/LVzxyF64338aSa7oqUtmT7FZIEeokzB+U0QQU+JMGiDqXkqzKEN1PuTGxkOT
	 //LwbGQPGk3adWoWh8IMMSnqLyXc8+vBTuaZ+3OFOpE6uIPmxYAm5ZfRyWBa1R60N4
	 y5KuYPxCWvGWwYslxVb07bA2hu+unFT0IvAGi3IXFEEKerkfmgPg5/T0GMlEUimbA6
	 Ts9hhscmhZErBPVz9+ubpe6PA2uaakl4d606lxDEVA2l6AZKHTnD44tsIHsKBOd406
	 qLqbkS+9zQoSg==
Message-ID: <005424c2-7fb7-48db-b38c-c62f9f8b3897@kernel.org>
Date: Wed, 5 Mar 2025 20:37:00 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] firmware: samsung: add ACPM debugfs support
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: andre.draszik@linaro.org, peter.griffin@linaro.org,
 willmcvicker@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
 <20250224-acpm-debugfs-v1-3-2418a3ea1b17@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250224-acpm-debugfs-v1-3-2418a3ea1b17@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/02/2025 09:01, Tudor Ambarus wrote:
> The ACPM firmware saves debug information to SRAM. Add debugfs entries
> in order to expose the ACPM logs.
> 
> acpm_framework/logb_gprio_level controls the ACPM print verbosity to
> the SRAM log buffer. It encodes a 64 bit value, 4 bits for each of the
> 16 Plugin IDs, with verbosity levels from 0xf (log error) to
> 0x0 (log debug).
> 
> echo 0xffffffffffffff1f > /sys/kernel/debug/acpm_framework/logb_gprio_level
> Will allow only LOG_ERR prints for all Plugin IDs but Plugin ID 1,
> which will issue prints for any log levels greater or equal to 1.
> On the ACPM firmware side, logb_gprio_level has a default value of zero,
> all logs enabled for all Plugin IDs.
> 
> acpm_framework/log_level has a maximum value of 2 and controls which
> SRAM log buffers are printed.
> 
> Finally, acpm_framework/acpm_debug_cmd provides a way to issue
> ACPM DEBUG commands to the firmware.

Please add something like above also as a comment to the driver, so the
interface will be documented.

> 
> Add ACPM debugfs support with the above capabilities.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---


...

> +
> +union acpm_log_entry {
> +	u32 raw[4];
> +	struct {
> +		u32 systicks0 : 24;
> +		u32 dummy : 2;
> +		u32 is_err : 1;
> +		u32 is_raw : 1;
> +		u32 plugin_id : 4;
> +		u32 systicks24;
> +		u32 msg : 24;
> +		u32 systicks56 : 8;
> +		u32 data;
> +	} __packed;
> +};
> +
> +static struct dentry *rootdir;

exynos-apcm.c is not a singleton, so neither should this be. You should
create entries per device (so with device name as subdirectory), just
for correctness.

> +
> +static DEFINE_MUTEX(acpm_log_level_mutex);

And this also looks per-device-instance.

> +
> +static void acpm_log_print_entry(struct acpm_info *acpm,
> +				 const union acpm_log_entry *log_entry)
> +{
> +	u64 systicks, time, msg;
> +
> +	if (log_entry->is_err)
> +		return;
> +
> +	if (log_entry->is_raw) {
> +		dev_info(acpm->dev, "[ACPM_FW raw] : id:%u, %x, %x, %x\n",
> +			 log_entry->plugin_id, log_entry->raw[1],
> +			 log_entry->raw[2], log_entry->raw[3]);
> +	} else {
> +		systicks = ((u64)(log_entry->systicks56) << 56) +
> +			   ((u64)(log_entry->systicks24) << 24) +
> +			   log_entry->systicks0;
> +
> +		/* report time in ns */
> +		time = mul_u64_u32_div(systicks, ACPM_APM_SYSTICK_PERIOD_PS,
> +				       1000);
> +
> +		msg = readl(acpm->sram_base + log_entry->msg);
> +
> +		dev_info(acpm->dev, "[ACPM_FW] : %llu id:%u, %s, %x\n", time,
> +			 log_entry->plugin_id, (char *)&msg, log_entry->data);


I don't think these should be printed to dmesg - these are not system
logs. You either return the contents to the caller's read() on debugfs
entry or, if this is anyhow crashdump related, it goes to
pstore/minidump once triggered. Or to ramoops.

Depends what these logs are (so please also explain what do you find
there in the commit msg).

Maybe something like CHROMEOS_PSTORE?

IOW, if enabled, this should go to ramoops/pstore unconditionally. For
runtime debugging this should be returned somehow to the userspace
reading the file. I think usually debugfs and sysfs is not expected to
provide more than PAGE_SIZE data, so this second part has to be
rethinked still.

> +	}
> +}
> +
> +static void acpm_log_print_entries(struct acpm_info *acpm,
> +				   struct acpm_log_buf *lbuf)
> +{
> +	union acpm_log_entry log_entry = {0};
> +	u32 front, rear;
> +
> +	front = readl(lbuf->q.front);
> +	rear = lbuf->rear_index;
> +
> +	while (rear != front) {
> +		__ioread32_copy(&log_entry, lbuf->q.base + lbuf->mlen * rear,
> +				sizeof(log_entry) / 4);
> +
> +		acpm_log_print_entry(acpm, &log_entry);
> +
> +		if (lbuf->qlen == rear + 1)
> +			rear = 0;
> +		else
> +			rear++;
> +
> +		lbuf->rear_index = rear;
> +		front = readl(lbuf->q.front);
> +	}
> +}
> +
> +static void acpm_log_print(struct acpm_info *acpm)
> +{
> +	struct acpm_log_info *acpm_log = acpm->log;
> +
> +	guard(mutex)(&acpm_log_level_mutex);
> +
> +	if (acpm_log->level == 0)
> +		return;
> +
> +	if (acpm_log->level == ACPM_LOG_LEVEL_MAX)
> +		acpm_log_print_entries(acpm, &acpm_log->preempt);
> +
> +	acpm_log_print_entries(acpm, &acpm_log->normal);
> +}
> +
> +static void acpm_work_fn(struct work_struct *work)
> +{
> +	struct acpm_log_info *acpm_log =
> +		container_of(work, struct acpm_log_info, work.work);
> +	struct acpm_info *acpm = acpm_log->acpm;
> +
> +	acpm_log_print(acpm);
> +
> +	queue_delayed_work(acpm_log->wq, &acpm_log->work,
> +			   msecs_to_jiffies(acpm_log->poll_period));
> +}
> +
> +static int acpm_log_level_get(void *data, u64 *val)
> +{
> +	struct acpm_info *acpm = data;
> +
> +	*val = acpm->log->level;
> +
> +	return 0;
> +}
> +
> +static int acpm_log_level_set(void *data, u64 val)
> +{
> +	struct acpm_info *acpm = data;
> +	struct acpm_log_info *acpm_log = acpm->log;
> +
> +	if (val > ACPM_LOG_LEVEL_MAX) {
> +		dev_err(acpm->dev, "Log level %llu out of range [0:%u]!\n",
> +			val, ACPM_LOG_LEVEL_MAX);
> +		return -EINVAL;
> +	}
> +
> +	scoped_guard(mutex, &acpm_log_level_mutex)
> +		acpm_log->level = val;
> +
> +	if (acpm_log->level == 0)
> +		cancel_delayed_work_sync(&acpm_log->work);
> +	else
> +		queue_delayed_work(acpm_log->wq, &acpm_log->work,
> +				   msecs_to_jiffies(acpm_log->poll_period));
> +	return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(acpm_log_level_fops, acpm_log_level_get,
> +			 acpm_log_level_set, "0%llu\n");

I also do not think debugfs is a knob to control loglevel of messages
going to dmesg.

Best regards,
Krzysztof
