From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v6 0/5] MCPM backend for Exynos5420
Date: Mon, 19 May 2014 23:30:51 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1405192321040.17310@knanqh.ubzr>
References: <1399982324-27879-1-git-send-email-a.kesavan@samsung.com> <alpine.LFD.2.11.1405131325060.980@knanqh.ubzr> <CAM4voanvVwj+FuWazTGMHMnM64Cw_qK03D3o=raS43f_zWFfog@mail.gmail.com> <alpine.LFD.2.11.1405140031490.980@knanqh.ubzr>
 <CAM4voa=6osyXYg_XF=XuGRYmxLDUO+5=-i+cMrNW92fzBZJjfA@mail.gmail.com> <alpine.LFD.2.11.1405140931380.980@knanqh.ubzr> <CAM4voam29e7aK7n86_Mpj-wwvkchm-e68qA5=iUFou+sUMONig@mail.gmail.com> <CAM4voakB57mgyQmtkpCUAF1BVW5z3BGsesvxvTuSg_JwBh-sxw@mail.gmail.com>
 <alpine.LFD.2.11.1405151250070.17310@knanqh.ubzr> <CAM4voakoSd0DXvG_fSXSAYxjMDNJmvOY5GMW=jQKD5Y0jTtJ+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f172.google.com ([209.85.216.172]:36397 "EHLO
	mail-qc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbaETDax (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 23:30:53 -0400
Received: by mail-qc0-f172.google.com with SMTP id l6so10364798qcy.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 20:30:52 -0700 (PDT)
In-Reply-To: <CAM4voakoSd0DXvG_fSXSAYxjMDNJmvOY5GMW=jQKD5Y0jTtJ+A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, "inderpal.s@samsung.com" <inderpal.s@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Martin <Dave.Martin@arm.com>, Tomasz Figa <t.figa@samsung.com>

On Mon, 19 May 2014, Abhilash Kesavan wrote:

> Hi Nicolas,
> 
> On Thu, May 15, 2014 at 10:22 PM, Nicolas Pitre
> <nicolas.pitre@linaro.org> wrote:
> > Once you implement full cluster shutdown I can provide you with another
> > script stressing that part.
> I am done with the cluster power on/off code and it seems to work fine
> with bL_switcher. Can you please provide me with your stress script.

Here's the script.  Credits go to Dave Martin for this one.

The script assumes that cluster 0 comprises cpus 0 to 3 and cluster 1 
comprises cpus 4 to 7.  You need to edit it otherwise.

----- >8
#!/bin/bash

echo 0 >/sys/kernel/bL_switcher/active
sleep 1

pids=

for x in \
	"cluster=cluster0; cpus='cpu0 cpu1 cpu2 cpu3'" \
	"cluster=cluster1; cpus='cpu4 cpu5 cpu6 cpu7'"
do
	eval "$x"
	eval "\
$cluster () {
	pids=
		`for cpu in $cpus; do cat <<EOF; done
	(sleep .00\\$RANDOM; echo \\$1 >/sys/devices/system/cpu/$cpu/online)&
	echo \\$1 >/sys/devices/system/cpu/$cpu/online&
	pids=\\$pids\ \\$!
EOF`
	wait \$pids
	if [ \$1 = 0 ]; then
		echo \"\$n: $cluster off\"
	else
		echo \"\$n: $cluster on\"
	fi
}"
done

n=0
while :; do
	: $((++n))
	cluster1 1; cluster0 0
	cluster0 1; cluster1 0
done
----- >8


Nicolas
