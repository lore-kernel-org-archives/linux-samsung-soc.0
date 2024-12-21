Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E661DC997;
	Sat, 21 Dec 2024 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734769700; cv=none; b=Frqsj/3wMsHt92UufwV8HSYJphj3aaEAXXvChkWNfB5Vtzxjl1j3a99sOz+16AL5DKml6LQVVAYXjsNj3RYHowVuiExYQw8SB9v5YA8CD+oT7q0TXX1vBcWmRNsQFATPooAVkpSVEXW7QDygpgEuFIpRFXqqkAoCD1zPwSgobXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734769700; c=relaxed/simple;
	bh=T78QzclBUAPQSNOb3TrxqRm+umAyg/4pAny0vdSt1Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jy4DkHAa40O2MNZwCk2eNrc/Uuipy2SxT78jl0WY7qZYODnLmXUIPFnA/Q7a5Kfbj6AJN8zHD94jexYWW2DuTqV6HRhCT0+JB7sTA8JofBYllVA4v+Jk39Dtbc1lWDuLWk9mQ11/a7bSq8WX1o6dtZEUNTuXKRdOEG+QofIgAwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBr+VBAY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBr+VBAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734769698; x=1766305698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T78QzclBUAPQSNOb3TrxqRm+umAyg/4pAny0vdSt1Q8=;
  b=cBr+VBAYzA7OLgUj1S/3SnhVrYG2LmOj9n1oULs0+kc7Do+v+1nNny0/
   ydS1LqN1R/e6Xm7V3jnkQ5h98j3NGWmzU1VFBrYFfbzdGm1YwDDQhypgf
   StSKg1yRwKQd2XPELpSOKiK1HpBCh6buxxfKiX6TODSjidCecnXznaHdU
   tYhaVlakzOFZS83SW+UIiXgN0Yta9AAScPa5maQpcmmBkLj/lCNwT/E5E
   8QDdqT9Ua1A8NHMbduHOyeZYTCFdd0MH6JvcV62irfIBH/zQC5ani/LOb
   qCs9SrXDhmI8YQknx/1x8dIOkYZ76uHI2M9NNa1i1yzcqrwZ+4LccbbEx
   g==;
X-CSE-ConnectionGUID: Pw5bWAApTs2/2NLxDk/ozQ==
X-CSE-MsgGUID: 5Kgx8GdLRTe7LFU5w90dcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35194604"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="35194604"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 00:28:17 -0800
X-CSE-ConnectionGUID: QNFIDEbZRVajtDEnqen2qw==
X-CSE-MsgGUID: ZpkBAbhIQBCR3Io65oR+LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103722115"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Dec 2024 00:28:14 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOuqI-000255-2Y;
	Sat, 21 Dec 2024 08:28:10 +0000
Date: Sat, 21 Dec 2024 16:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
	peter.griffin@linaro.org, kernel-team@android.com,
	willmcvicker@google.com, daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v6 3/5] mailbox: add support for clients to request
 channels by args
Message-ID: <202412211604.qPMHGnk0-lkp@intel.com>
References: <20241220-acpm-v4-upstream-mbox-v6-3-a6942806e52a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-3-a6942806e52a@linaro.org>

Hi Tudor,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8]

url:    https://github.com/intel-lab-lkp/linux/commits/Tudor-Ambarus/dt-bindings-mailbox-allow-mbox-cells-0/20241220-215938
base:   78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
patch link:    https://lore.kernel.org/r/20241220-acpm-v4-upstream-mbox-v6-3-a6942806e52a%40linaro.org
patch subject: [PATCH v6 3/5] mailbox: add support for clients to request channels by args
config: x86_64-buildonly-randconfig-001-20241221 (https://download.01.org/0day-ci/archive/20241221/202412211604.qPMHGnk0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211604.qPMHGnk0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211604.qPMHGnk0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/mailbox.c:486: warning: Function parameter or struct member 'mbox_spec' not described in 'mbox_request_channel_by_args'
>> drivers/mailbox/mailbox.c:486: warning: Excess function parameter 'spec' description in 'mbox_request_channel_by_args'


vim +486 drivers/mailbox/mailbox.c

   469	
   470	/**
   471	 * mbox_request_channel_by_args - request a mailbox channel using client's
   472	 * channel identifiers.
   473	 * @cl: identity of the client requesting the channel.
   474	 * @index: index of mailbox specifier in 'mboxes' property.
   475	 * @spec: arguments that describe the channel.
   476	 *
   477	 * Used by clients that can discover the channel identifiers at runtime (by
   478	 * parsing a shared memory for example). The description of
   479	 * mbox_request_channel() applies here as well.
   480	 *
   481	 * Return: Pointer to the channel assigned to the client if successful.
   482	 *         ERR_PTR for request failure.
   483	 */
   484	struct mbox_chan *mbox_request_channel_by_args(struct mbox_client *cl,
   485				int index, const struct mbox_xlate_args *mbox_spec)
 > 486	{
   487		struct of_phandle_args of_args;
   488		struct device *dev = cl->dev;
   489		struct mbox_controller *mbox;
   490		struct mbox_chan *chan;
   491		int ret;
   492	
   493		if (!dev || !dev->of_node) {
   494			pr_debug("%s: No owner device node\n", __func__);
   495			return ERR_PTR(-ENODEV);
   496		}
   497	
   498		if (of_parse_phandle_with_args(dev->of_node, "mboxes",
   499					       "#mbox-cells", index, &of_args)) {
   500			dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
   501			return ERR_PTR(-ENODEV);
   502		}
   503	
   504		mutex_lock(&con_mutex);
   505	
   506		chan = ERR_PTR(-EPROBE_DEFER);
   507		list_for_each_entry(mbox, &mbox_cons, node)
   508			if (mbox->dev->of_node == of_args.np && mbox->xlate) {
   509				chan = mbox->xlate(mbox, mbox_spec);
   510				if (!IS_ERR(chan))
   511					break;
   512			}
   513	
   514		of_node_put(of_args.np);
   515	
   516		if (IS_ERR(chan)) {
   517			mutex_unlock(&con_mutex);
   518			return chan;
   519		}
   520	
   521		ret = __mbox_bind_client(chan, cl);
   522		if (ret)
   523			chan = ERR_PTR(ret);
   524	
   525		mutex_unlock(&con_mutex);
   526		return chan;
   527	}
   528	EXPORT_SYMBOL_GPL(mbox_request_channel_by_args);
   529	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
