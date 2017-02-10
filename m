From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] Exynos5422-odroidxu3: Incomplete thermal-zones definition
Date: Fri, 10 Feb 2017 17:46:34 +0200
Message-ID: <20170210154634.57z4kvmo7giz4zej@kozik-lap>
References: <9e32c530-0d15-223f-c280-617f8ae2540d@gmail.com>
 <20170207212830.23mzswabqplece2s@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36540 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753209AbdBJPsG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Feb 2017 10:48:06 -0500
Received: by mail-wm0-f66.google.com with SMTP id r18so7958748wmd.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Feb 2017 07:46:41 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170207212830.23mzswabqplece2s@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Willy WOLFF <willy.mh.wolff@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

On Tue, Feb 07, 2017 at 11:28:30PM +0200, Krzysztof Kozlowski wrote:

(...)

> > +				/*
> > +				 * When reaching cpu0_alert4, reduce CPU
> > +				 * further, down to 600 MHz (12 steps for big,
> > +				 * 7 steps for LITTLE).
> > +				 */
> > +				map5 {
> > +					trip = <&cpu0_alert4>;
> > +					cooling-device = <&cpu0 3 7>;
> > +				};
> > +				map6 {
> > +					trip = <&cpu0_alert4>;
> > +					cooling-device = <&cpu4 3 12>;
> > +				};
> 
> That is a quite big code duplication with a lot of possible errors to do
> (differs only by cpu number). We should do this in a smarter way.
> 
> How about extending the thermal driver for setting the trips also for
> other thermal zones?
> 
> > +			};
> > +		};
> > +		cpu1_thermal: cpu1-thermal {
> > +			thermal-sensors = <&tmu_cpu1 0>;

I confirmed your findings (taskset -c 5 dd if=/dev/zero of=/dev/null)
however thermal zones indices do not match CPU.

busy CPU              | the most rising temp | TMU zone for this diff
=====================================================================
CPU4 (first A15)      | 52                   | thermal_zone0
CPU5                  | 70                   | thermal_zone3
CPU6                  | 74                   | thermal_zone2
CPU7                  | 66                   | thermal_zone1
CPU5-CPU7             | 97                   | thermal_zone3 (but 2 similar)

The sensors are not showing the same temperature - neither in idle nor
in busy cycle. Maybe they are not properly calibrated or located in
symmetric location?

However the difference between idle and busy states is more or less
similar between thermal zones - making one A15 busy heats:
1. associated thermal zone by 21-26 degrees of C,
2. other thermal zones by 13-18 degrees (zone 3 is weird here).

Thermal zone 4 is probably GPU.

Anyway the bindings for thermal zones are not nice in this case and they
require huge duplication of data... Maybe this could be done smarter
way...

Full data:
https://docs.google.com/spreadsheets/d/1XOpRCK0YjnxaZgjLcasRdKXaFFVh3EqyvrDi_YcmBGE/edit?usp=sharing


Best regards,
Krzysztof
