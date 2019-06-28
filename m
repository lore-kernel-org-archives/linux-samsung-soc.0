From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 01/39] docs: thermal: add it to the driver API
Date: Fri, 28 Jun 2019 09:29:54 -0300
Message-ID: <c9c7d7e0567aed7e36c4eb9c09ddfb6274913e9c.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Amit Daniel Kachhap <amit.kachhap@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, Javi Merino <javi.merino@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The file contents mostly describes driver internals.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/driver-api/index.rst                   |  1 +
 .../{ => driver-api}/thermal/cpu-cooling-api.rst     |  0
 .../{ => driver-api}/thermal/exynos_thermal.rst      |  0
 .../thermal/exynos_thermal_emulation.rst             |  0
 Documentation/{ => driver-api}/thermal/index.rst     |  2 --
 .../{ => driver-api}/thermal/intel_powerclamp.rst    |  0
 .../{ => driver-api}/thermal/nouveau_thermal.rst     |  0
 .../{ => driver-api}/thermal/power_allocator.rst     |  0
 Documentation/{ => driver-api}/thermal/sysfs-api.rst | 12 ++++++------
 .../thermal/x86_pkg_temperature_thermal.rst          |  2 +-
 MAINTAINERS                                          |  2 +-
 include/linux/thermal.h                              |  4 ++--
 12 files changed, 11 insertions(+), 12 deletions(-)
 rename Documentation/{ => driver-api}/thermal/cpu-cooling-api.rst (100%)
 rename Documentation/{ => driver-api}/thermal/exynos_thermal.rst (100%)
 rename Documentation/{ => driver-api}/thermal/exynos_thermal_emulation.rst (100%)
 rename Documentation/{ => driver-api}/thermal/index.rst (95%)
 rename Documentation/{ => driver-api}/thermal/intel_powerclamp.rst (100%)
 rename Documentation/{ => driver-api}/thermal/nouveau_thermal.rst (100%)
 rename Documentation/{ => driver-api}/thermal/power_allocator.rst (100%)
 rename Documentation/{ => driver-api}/thermal/sysfs-api.rst (98%)
 rename Documentation/{ => driver-api}/thermal/x86_pkg_temperature_thermal.rst (94%)

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 0dbaa987aa11..4e503e360860 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -56,6 +56,7 @@ available subsections can be seen below.
    dmaengine/index
    slimbus
    soundwire/index
+   thermal/index
    fpga/index
    acpi/index
    generic-counter
diff --git a/Documentation/thermal/cpu-cooling-api.rst b/Documentation/driver-api/thermal/cpu-cooling-api.rst
similarity index 100%
rename from Documentation/thermal/cpu-cooling-api.rst
rename to Documentation/driver-api/thermal/cpu-cooling-api.rst
diff --git a/Documentation/thermal/exynos_thermal.rst b/Documentation/driver-api/thermal/exynos_thermal.rst
similarity index 100%
rename from Documentation/thermal/exynos_thermal.rst
rename to Documentation/driver-api/thermal/exynos_thermal.rst
diff --git a/Documentation/thermal/exynos_thermal_emulation.rst b/Documentation/driver-api/thermal/exynos_thermal_emulation.rst
similarity index 100%
rename from Documentation/thermal/exynos_thermal_emulation.rst
rename to Documentation/driver-api/thermal/exynos_thermal_emulation.rst
diff --git a/Documentation/thermal/index.rst b/Documentation/driver-api/thermal/index.rst
similarity index 95%
rename from Documentation/thermal/index.rst
rename to Documentation/driver-api/thermal/index.rst
index 8c1c00146cad..68ceb6886561 100644
--- a/Documentation/thermal/index.rst
+++ b/Documentation/driver-api/thermal/index.rst
@@ -1,5 +1,3 @@
-:orphan:
-
 =======
 Thermal
 =======
diff --git a/Documentation/thermal/intel_powerclamp.rst b/Documentation/driver-api/thermal/intel_powerclamp.rst
similarity index 100%
rename from Documentation/thermal/intel_powerclamp.rst
rename to Documentation/driver-api/thermal/intel_powerclamp.rst
diff --git a/Documentation/thermal/nouveau_thermal.rst b/Documentation/driver-api/thermal/nouveau_thermal.rst
similarity index 100%
rename from Documentation/thermal/nouveau_thermal.rst
rename to Documentation/driver-api/thermal/nouveau_thermal.rst
diff --git a/Documentation/thermal/power_allocator.rst b/Documentation/driver-api/thermal/power_allocator.rst
similarity index 100%
rename from Documentation/thermal/power_allocator.rst
rename to Documentation/driver-api/thermal/power_allocator.rst
diff --git a/Documentation/thermal/sysfs-api.rst b/Documentation/driver-api/thermal/sysfs-api.rst
similarity index 98%
rename from Documentation/thermal/sysfs-api.rst
rename to Documentation/driver-api/thermal/sysfs-api.rst
index e4930761d3e5..fab2c9b36d08 100644
--- a/Documentation/thermal/sysfs-api.rst
+++ b/Documentation/driver-api/thermal/sysfs-api.rst
@@ -552,7 +552,7 @@ emul_temp
 sustainable_power
 	An estimate of the sustained power that can be dissipated by
 	the thermal zone. Used by the power allocator governor. For
-	more information see Documentation/thermal/power_allocator.rst
+	more information see Documentation/driver-api/thermal/power_allocator.rst
 
 	Unit: milliwatts
 
@@ -563,7 +563,7 @@ k_po
 	controller during temperature overshoot. Temperature overshoot
 	is when the current temperature is above the "desired
 	temperature" trip point. For more information see
-	Documentation/thermal/power_allocator.rst
+	Documentation/driver-api/thermal/power_allocator.rst
 
 	RW, Optional
 
@@ -572,7 +572,7 @@ k_pu
 	controller during temperature undershoot. Temperature undershoot
 	is when the current temperature is below the "desired
 	temperature" trip point. For more information see
-	Documentation/thermal/power_allocator.rst
+	Documentation/driver-api/thermal/power_allocator.rst
 
 	RW, Optional
 
@@ -580,14 +580,14 @@ k_i
 	The integral term of the power allocator governor's PID
 	controller. This term allows the PID controller to compensate
 	for long term drift. For more information see
-	Documentation/thermal/power_allocator.rst
+	Documentation/driver-api/thermal/power_allocator.rst
 
 	RW, Optional
 
 k_d
 	The derivative term of the power allocator governor's PID
 	controller. For more information see
-	Documentation/thermal/power_allocator.rst
+	Documentation/driver-api/thermal/power_allocator.rst
 
 	RW, Optional
 
@@ -598,7 +598,7 @@ integral_cutoff
 	example, if integral_cutoff is 0, then the integral term only
 	accumulates error when temperature is above the desired
 	temperature trip point. For more information see
-	Documentation/thermal/power_allocator.rst
+	Documentation/driver-api/thermal/power_allocator.rst
 
 	Unit: millidegree Celsius
 
diff --git a/Documentation/thermal/x86_pkg_temperature_thermal.rst b/Documentation/driver-api/thermal/x86_pkg_temperature_thermal.rst
similarity index 94%
rename from Documentation/thermal/x86_pkg_temperature_thermal.rst
rename to Documentation/driver-api/thermal/x86_pkg_temperature_thermal.rst
index f134dbd3f5a9..2ac42ccd236f 100644
--- a/Documentation/thermal/x86_pkg_temperature_thermal.rst
+++ b/Documentation/driver-api/thermal/x86_pkg_temperature_thermal.rst
@@ -40,7 +40,7 @@ This contains two trip points:
 - trip_point_1_temp
 
 User can set any temperature between 0 to TJ-Max temperature. Temperature units
-are in milli-degree Celsius. Refer to "Documentation/thermal/sysfs-api.rst" for
+are in milli-degree Celsius. Refer to "Documentation/driver-api/thermal/sysfs-api.rst" for
 thermal sys-fs details.
 
 Any value other than 0 in these trip points, can trigger thermal notifications.
diff --git a/MAINTAINERS b/MAINTAINERS
index 7ba6d174f49f..9d3a408f5ce1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15762,7 +15762,7 @@ M:	Viresh Kumar <viresh.kumar@linaro.org>
 M:	Javi Merino <javi.merino@kernel.org>
 L:	linux-pm@vger.kernel.org
 S:	Supported
-F:	Documentation/thermal/cpu-cooling-api.rst
+F:	Documentation/driver-api/thermal/cpu-cooling-api.rst
 F:	drivers/thermal/cpu_cooling.c
 F:	include/linux/cpu_cooling.h
 
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 681047f8cc05..e45659c75920 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -251,7 +251,7 @@ struct thermal_bind_params {
 	 * platform characterization. This value is relative to the
 	 * rest of the weights so a cooling device whose weight is
 	 * double that of another cooling device is twice as
-	 * effective. See Documentation/thermal/sysfs-api.rst for more
+	 * effective. See Documentation/driver-api/thermal/sysfs-api.rst for more
 	 * information.
 	 */
 	int weight;
@@ -259,7 +259,7 @@ struct thermal_bind_params {
 	/*
 	 * This is a bit mask that gives the binding relation between this
 	 * thermal zone and cdev, for a particular trip point.
-	 * See Documentation/thermal/sysfs-api.rst for more information.
+	 * See Documentation/driver-api/thermal/sysfs-api.rst for more information.
 	 */
 	int trip_mask;
 
-- 
2.21.0
