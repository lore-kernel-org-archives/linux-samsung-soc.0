From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/2] PM / Domains: Add OF support
Date: Mon, 2 Jan 2012 09:17:46 +0530
Message-ID: <CAJuYYwQp7gfuovd8kKEe_D+ACyq4OafxZRW_G=U_9zCMOy+prA@mail.gmail.com>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>
	<201112262144.42211.rjw@sisk.pl>
	<CAJuYYwT4bW0mMeUb18_WacaybQZskPsiqm6wvfMZOMk3U8UO4w@mail.gmail.com>
	<201112282317.54291.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:35504 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751690Ab2ABDrr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Jan 2012 22:47:47 -0500
In-Reply-To: <201112282317.54291.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, patches@linaro.org

Hi Rafael,

On 29 December 2011 03:47, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Wednesday, December 28, 2011, Thomas Abraham wrote:
>> Hi Mark, Rafael,
>
> Hi,
>
>> On 27 December 2011 02:14, Rafael J. Wysocki <rjw@sisk.pl> wrote:
>> > On Monday, December 26, 2011, Mark Brown wrote:
>> >> On Mon, Dec 26, 2011 at 08:13:19PM +0100, Rafael J. Wysocki wrote=
:
>> >> > On Monday, December 12, 2011, Thomas Abraham wrote:
>> >>
>> >> > > A device node pointer is added to generic pm domain structure=
 to associate
>> >> > > the domain with a node in the device tree.
>> >>
>> >> > That sounds fine except for one thing: PM domains are not devic=
es, so adding
>> >> > "device node" pointers to them is kind of confusing. =A0Perhaps=
 there should be
>> >> > something like struct dt_node, representing a more general devi=
ce tree node?
>> >>
>> >> There's struct of_node which is exactly that, though practically
>> >> speaking you need a device if you're going to bind automatically =
to
>> >> something from the device tree in a sensible fashion and there is=
 actual
>> >> hardware under there so a device does make some sense.
>>
>> In patch 2/2 of this series, the platform code looks for nodes in
>> device tree that represent a power domain. When a power domain node =
is
>> found, a generic power domain is instantiated with pm_genpd_init()
>> using the information available from the node in device tree. There =
is
>> no automatic binding required in this case. The power domain node do=
es
>> represent a hardware that manages the power domain.
>
> Good. =A0So would it be possible to use struct of_node instead of
> struct device_node in struct generic_pm_domain?

Sorry, I used 'struct of_node' and 'struct device_node'
interchangeably in my reply. All the nodes in a device tree are
represented by 'struct device_node'.

>
>> >>
>> >> This is in part compatibility with the existing Exynos code which=
 uses
>> >> devices to probe the domains for non-DT systems.
>> >
>> > Well, that's not a general case, though.
>> >
>> > It doesn't feel approporiate to use a "device node" pointer for so=
mething
>> > that's not based on struct device, at least not a generic level, s=
o I wonder
>> > if there's a different way.
>>
>> A device node pointer or of_node pointer is a simple pointer to a
>> instance of a node in device tree. All nodes in a device tree need n=
ot
>> represent a corresponding 'struct device'. A node in device tree can
>> described a hardware feature such as a power domain supported in the
>> hardware.
>
> Sure.
>
>> The addition of device tree support for generic power domains in thi=
s
>> patchset is generic for all platforms. The platform code instantiate=
s
>> generic power domains from device tree with the of_node pointer
>> assigned to 'struct generic_pm_domain'. Then, in
>> __pm_genpd_add_device(), given a of_node pointer (to gen_pd), it is
>> possible to find a matching power domain to select.
>
> My point was that adding the struct device_node pointer to
> struct generic_pm_domain didn't look good, because that structure did=
n't
> represent a device in general. =A0While I understand that it may be r=
egarded
> as a "device object" on some platforms, there are platforms that don'=
t
> regard PM domains as devices. =A0For this reason (and only for this r=
eason)
> it appears to be more appropriate to use a more generic device tree n=
ode
> type for struct generic_pm_domain.

If a platform uses some hardware controls (register read/writes) to
enable/disable/control power domain, then it can be represented in the
device tree. But such a node need not represent a 'struct device'.
Other nodes in the device tree can then reference the power domain
node.

If a platform does not have any hardware knobs for controlling power
domains, then probably it will not be represented in the device tree.
But I am not sure of this case.

The 'struct device_node' is a representation of a instance of a device
tree node. It can represent nodes that are not devices. Hence, it can
be used to represent a power domain in a device tree and also included
in the 'struct generic_pm_domain'.

Thanks,
Thomas.


>
> Thanks,
> Rafael
