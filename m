From: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/3] i2c-s3c2410: Rework device type handling
Date: Thu, 15 Mar 2012 17:54:33 +0100
Message-ID: <4F621EC9.6020106@samsung.com>
References: <1331657679-31302-1-git-send-email-k.lewandowsk@samsung.com>
 <1331657679-31302-3-git-send-email-k.lewandowsk@samsung.com>
 <20120314172915.GB13393@sirena.org.uk> <4F61BEC8.4030008@samsung.com>
 <20120315125630.GK3138@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20120315125630.GK3138-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 15.03.2012 13:56, Mark Brown wrote:

> On Thu, Mar 15, 2012 at 11:04:56AM +0100, Karol Lewandowski wrote:
> 
>> Introducing separate type (TYPE_S3C2440_HDMIPHY) has been our original
>> attempt to solve this issue.  However, this required adding explicit
>> checks to driver code all over the place (if (type == S3C2400 ||
>> type == S3c2440_HDMIPHY).
> 
> Another option is to change the type to be a pointer to a struct with
> quirk flags in it.


Sure, that's possible.   However, I don't find it any simpler than
using  bitmasks.  Quite to contrary - I consider it redundant to
bring new structure into existence when simple uint does the trick
just fine (IMHO, of course).

If you consider code to be inherently less readable because of this
approach I'll rework it.  If it's not a such big deal for you I would
prefer to keep it as is.

Thanks!
-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
